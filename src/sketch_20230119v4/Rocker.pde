
class Rocker {
  PGraphics img;
  float x, y, w, h;
  float period = 1, max = (float)Math.PI / 16.0;

  Rocker(String filename, float x, float y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    img = createGraphics(w, h);
    img.beginDraw();
    img.image(loadImage(filename), 0, 0, w, h);
    img.endDraw();
  }

  void draw(float time) {
    pushMatrix();

    float p = (time % period) / period;
    int stage = int(time / period) % 2;

    //float angle = (float)(-Math.cos(2.0 * Math.PI * p) + 1.0) / 2.0 * max;
    float angle = (float)Math.sin(Math.PI * p) * max;
    if (stage == 0) {
      translate(x + w * 0.75, y + h);
      rotate(angle);
      image(img, -w * 0.75, -h);
    } else {
      translate(x + w * 0.25, y + h);
      rotate(-angle);
      image(img, -w * 0.25, -h);
    }

    popMatrix();
  }
}
