
Point origin = new Point(0, 0);

void draw(Orbit o, float t) {
  o.update(t);

  Point p = o.get(origin);
  noStroke();
  fill(0, 0, 0);
  ellipse(p.x, p.y, 8, 8);
}

boolean first = true;
Point point = new Point(0, 0);
float time = 0;
float step = 0.1;
final float min = 10;
final float max = 15;

void draw(PGraphics g, Orbit o) {
  Point p = get(o, time, step);
  if (first) {
    first = false;
    point = p;
  }

  while (isLess(point, p, min)) {
    step += step;
    p = get(o, time, step);
  }
  while (!isLess(point, p, max)) {
    step = step * 0.75;
    p = get(o, time, step);
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
