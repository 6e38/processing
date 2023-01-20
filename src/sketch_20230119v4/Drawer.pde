
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

void draw(Orbit o) {
  Point p = get(o, time, step);
  if (first) {
    first = false;
    point = p;
  }

  if (isLess(point, p, 2.0)) {
    while (isLess(point, p, 2.0)) {
      step += step;
      p = get(o, time, step);
    }
  } else if (!isLess(point, p, 10.0)) {
    while (!isLess(point, p, 10.0)) {
      step = step / 2.0;
      p = get(o, time, step);
    }
  }

  time += step;
  noStroke();
  fill(0, 0, 0);
  ellipse(p.x, p.y, 8, 8);
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
