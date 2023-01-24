
class Drawer {
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

  Drawer(color c, Orbit orbit) {
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

    g.strokeWeight(3);
    g.stroke(c);
    g.noFill();
    g.line(point.x, point.y, p.x, p.y);

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

  void drawRadii() {
    if (time >= duration) {
      return;
    }
    
    pushMatrix();
    translate(width / 2, height / 2);
    ArrayList<Point> radii = o.getCenters(origin);
    radii.add(new Point(0, 0));
    Point last = null;
    int i = 0;
    for (Point p : radii) {
      if (last != null) {
        stroke(0, 0, 1);
        strokeWeight(5);
        noFill();
        line(p.x, p.y, last.x, last.y);
      }
      noStroke();
      fill(0, 0, 1);
      ellipse(p.x, p.y, 10 + i * 20, 10 + i * 20);
      last = p;
      i++;
    }
    popMatrix();
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
