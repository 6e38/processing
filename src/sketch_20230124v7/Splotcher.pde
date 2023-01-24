
class Splotcher {
  Point origin = new Point(0, 0);

  boolean first = true;
  Point point = new Point(0, 0);
  float time = 0;
  float step = 0.1;
  float duration;
  final float min = 10;
  final float max = 15;
  Orbit o;
  color c;

  Splotcher(color c, Orbit orbit) {
    this.c = c;
    o = orbit;
    duration = lcm(o.getPeriods());
  }
  
  float getTime() {
    return time;
  }

  boolean draw(PGraphics g) {
    if (time >= duration) {
      return false;
    }
    
    if (first) {
      first = false;
      point = get(o, time, 0);
      return true;
    }

    Point p = get(o, time, step);

    while (isLess(point, p, min)) {
      step += step;
      p = get(o, time, step);
    }

    while (!isLess(point, p, max)) {
      step = step * 0.75;
      p = get(o, time, step);
      if (step < 0.0001) {
        step = 0.0001;
        break;
      }
    }

    //g.strokeWeight(3);
    //g.stroke(c);
    //g.noFill();
    //g.line(point.x, point.y, p.x, p.y);
    
    
    float w = random(5.0) + 3.0;
    w *= w;
    float a = random(0.20);
    float jitterX = random(40) - 20.0;
    float jitterY = random(40) - 20.0;
    g.noStroke();
    g.fill(0.15, 1, 0.50, a);
    g.ellipse(point.x + jitterX, point.y + jitterY, w, w);

    time += step;
    point = p;
    return true;
  }

  Point get(Orbit o, float time, float step) {
    float t = time + step;
    o.update(t);
    return o.get(origin);
  }

  boolean isLess(Point p1, Point p2, float d) {
    float x = p1.x - p2.x;
    float y = p1.y - p2.y;
    return x * x + y * y < d * d;
  }

  int lcm(ArrayList<Integer> l) {
    int x = 0;
    for (Integer i : l) {
      if (x == 0) {
        x = Math.abs(i.intValue());
        continue;
      }
      x = lcm(x, Math.abs(i.intValue()));
    }
    return x;
  }
  
  int lcm(int a, int b) {
    int x = a, y = b;
    while (x != y) {
      if (x < y) {
        x += a;
      } else {
        y += b;
      }
    }
    return x;
  }
}
