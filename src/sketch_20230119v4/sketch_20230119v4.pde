
int Frames = 0;
float Rate = 60;

Orbit base;
PGraphics g;

void setup() {
  size(1080, 1920);
  frameRate(Rate);

  base = new Orbit(250, (float)Math.PI / 1.0);
  Orbit o1 = new Orbit(247, -(float)Math.PI / (96.0 / 53.0));
  Orbit o2 = new Orbit(200, (float)Math.PI / 3.2);
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
  scale(0.4);
  g.beginDraw();
  g.translate(width / 2.0, height / 2.0);
  //background(0, 0, 0.85);

  float t = 1 / Rate * Frames;

  draw(g, base);
  g.endDraw();
  image(g, 0, 0);

  noStroke();
  fill(0, 0, 1);
  textAlign(RIGHT);
  textSize(40);
  text(String.format("%.3f", t), width, height);

  noFill();
  stroke(0, 0, 1);
  strokeWeight(6);
  rect(3, 3, width - 3, height - 3);

  //saveFrame("frame-#####.tif");
  Frames++;
  //if (Frames > 30 * 20) {
  //  exit();
  //}
}
