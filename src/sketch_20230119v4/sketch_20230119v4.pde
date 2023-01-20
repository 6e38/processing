
int Frames = 0;
int iterations = 10;
float Rate = 30;
boolean Capture = false;

Orbit base;
PGraphics g;

void setup() {
  size(1080, 1920);
  frameRate(Rate);

  base = new Orbit(250 * 0.75, (float)Math.PI / 1.0);
  Orbit o1 = new Orbit(247 * 0.75, -(float)Math.PI / (96.0 / 53.0));
  Orbit o2 = new Orbit(200 * 0.75, (float)Math.PI / 3.2);
  o1.add(o2);
  base.add(o1);

  colorMode(HSB, 1);

  g = createGraphics(1080, 1920);
  g.beginDraw();
  g.colorMode(HSB, 1);
  g.background(0, 0, 0.1);
  g.endDraw();
}

void draw() {
  if (!Capture) {
    scale(0.4);

    noFill();
    stroke(0, 0, 1);
    strokeWeight(8);
    rect(0, 0, width, height);
  }

  g.beginDraw();
  g.translate(width / 2.0, height / 2.0);

  for (int i = 0; i < iterations; i++) {
    draw(g, base);
  }
  g.endDraw();
  image(g, 0, 0);

  if (Capture) {
    saveFrame("frame-#####.tif");
  }

  noStroke();
  fill(0, 0, 1);
  textAlign(RIGHT);
  textSize(50);
  text(String.format("%05d", Frames), width, 50);

  Frames++;
  if (Frames >= 1000) {
    noLoop();
  }
}
