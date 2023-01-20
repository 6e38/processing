
class Point {
  float x;
  float y;
  
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  String toString() {
    return String.format("(%.3f,%.3f)", x, y);
  }
}

class Orbit {
  float radius;
  float angle = 0;
  float rate;
  Orbit child = null;
  
  Orbit(float radius, float rate) {
    this.radius = radius;
    this.rate = rate;
  }
  
  void add(Orbit child) {
    this.child = child;
  }

  void update(float time) {
    angle = time * rate;
    if (child != null) {
      child.update(time);
    }
  }

  Point get(Point origin) {
    Point p = new Point(
      (float)Math.cos(angle) * radius + origin.x,
      (float)Math.sin(angle) * radius + origin.y);
    if (child == null) {
      return p;
    }
    return child.get(p);
  }
}
