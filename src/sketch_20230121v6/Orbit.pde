
class Point {
  float x;
  float y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  String toString() {
    return String.format("(%4.3f,%4.3f)", x, y);
  }

  Point clone() {
    return new Point(x, y);
  }
}

class Orbit {
  float radius, angleOffset, angle, rate;
  int period;
  Orbit child = null;

  Orbit(float radius, int period, float angle, Orbit child) {
    this.radius = radius;
    this.period = period;
    this.rate = 2.0 * (float)Math.PI / (float)period;
    this.angleOffset = angle;
    this.child = child;
  }

  void update(float time) {
    angle = time * rate + angleOffset;
    if (child != null) {
      child.update(time);
    }
  }

  Point point(Point origin) {
    return new Point(
      (float)Math.cos(angle) * radius + origin.x,
      (float)Math.sin(angle) * radius + origin.y);
  }

  Point get(Point origin) {
    Point p = point(origin);
    if (child == null) {
      return p;
    }
    return child.get(p);
  }

  ArrayList<Point> getCenters(Point origin) {
    Point p = point(origin);
    ArrayList<Point> list;
    if (child == null) {
      list = new ArrayList<>();
    } else {
      list = child.getCenters(p);
    }
    list.add(p);
    return list;
  }
  
  ArrayList<Integer> getPeriods() {
    ArrayList<Integer> list;
    if (child == null) {
      list = new ArrayList<>();
    } else {
      list = child.getPeriods();
    }
    list.add(period);
    return list;
  }
}
