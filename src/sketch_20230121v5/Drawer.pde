
class Drawer {
  Point origin = new Point(0, 0);

  boolean first = true;
  Point point = new Point(0, 0);
  float time = 0;
  float step = 0.1;
  final float min = 10;
  final float max = 15;
  Orbit o;

  Drawer(Orbit orbit) {
    o = orbit;
  }

  void draw(PGraphics g) {
    if (first) {
      first = false;
      point = get(o, time, 0);
      return;
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
    g.stroke(0, 0, 0.9);
    g.noFill();
    g.line(point.x, point.y, p.x, p.y);

    time += step;
    point = p;
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
}
