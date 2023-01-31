
class Path {
  final float Radius = 5.0;

  ArrayList<Dot> dots;
  ArrayList<Dot> queued;
  PGraphics g;

  Path() {
    dots = new ArrayList<>();
    for (int i = 0; i < 10; i++) {
      Dot d = new Dot(random(width), random(height), Radius);
      dots.add(d);
    }

    queued = new ArrayList<>();

    g = createGraphics(width, height);
    g.beginDraw();
    g.colorMode(HSB, 1);
    g.background(0.65, 0.05, 0.1);
    g.endDraw();
  }

  void draw(float t) {
    g.beginDraw();
    _draw(t);
    g.endDraw();
    image(g, 0, 0);
  }

  void _draw(float t) {
    for (Dot d : dots) {
      Dot newDot = branch(d);
      if (newDot != null) {
        queued.add(newDot);
      }
    }
    dots.addAll(queued);
    queued.clear();
  }

  Dot branch(Dot d) {
    if (d.isDone()) {
      return null;
    }

    float angle = random(2.0 * (float)Math.PI);
    float direction = 2.0 * (float)Math.PI / 60.0;
    float distance = Radius * 2.1 + random(0.9);
    for (float a = 0; a < 2.0 * (float)Math.PI; a += direction) {
      float _x = (float)Math.cos(angle + a) * distance + d.x;
      float _y = (float)Math.sin(angle + a) * distance + d.y;
      Dot _d = new Dot(_x, _y, Radius);
      if (!hit(_d) && inBounds(_d)) {
        g.noFill();
        g.stroke(0, 0, 1);
        g.strokeWeight(3);
        g.line(d.x, d.y, _d.x, _d.y);
        return _d;
      }
    }
    g.noStroke();
    g.fill(0, 0, 1);
    g.ellipse(d.x, d.y, Radius * 2.0, Radius * 2.0);
    d.markDone();
    return null;
  }

  boolean inBounds(Dot o) {
    return o.x - o.r > 0 && o.x + o.r < width && o.y - o.r > 0 && o.y + o.r < height;
    //return o.x > 0 && o.x < width && o.y > 0 && o.y < height;
    //return true;
  }

  boolean hit(Dot o) {
    for (Dot d : dots) {
      if (d.hit(o)) {
        return true;
      }
    }
    for (Dot d : queued) {
      if (d.hit(o)) {
        return true;
      }
    }
    return false;
  }
}
