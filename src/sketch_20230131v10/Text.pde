
class Text {
  PGraphics g;

  Text() {
    g = createGraphics(width, height);
    g.beginDraw();
    g.noStroke();
    g.fill(255, 200, 200, 128);

    PFont f = createFont("Alegreya-Bold.otf", 400);
    g.textFont(f);
    g.textAlign(CENTER);
    g.text("HIRE", width / 2, height * 0.5);
    g.text("ME!!!", width / 2, height * 0.7);

    g.endDraw();
  }

  void draw() {
    image(g, 0, 0);
  }

  boolean hit(Dot d) {
    int x = int(d.x);
    int y = int(d.y);
    color c = g.get(x, y);
    if (c != 0) {
      return true;
    }
    return false;
  }
}
