
int Frames = 0;
float Rate = 30;

Orbit base;

void setup() {
  size(1080, 1920);
  frameRate(Rate);

  base = new Orbit(250, (float)Math.PI / 24.0);
  Orbit o1 = new Orbit(50, -(float)Math.PI / 5);
  base.add(o1);

  colorMode(HSB, 1);
  background(0, 0, 0.85);
}

void draw() {
  scale(0.4);
  pushMatrix();
  translate(width / 2.0, height / 2.0);
  //background(0, 0, 0.85);

  float t = 1 / Rate * Frames;

  draw(base);

  noStroke();
  fill(0, 0, 0);
  textAlign(RIGHT);
  textSize(40);
  text(String.format("%.3f", t), width, height);

  popMatrix();

  noFill();
  stroke(0, 0, 0);
  strokeWeight(2);
  rect(1, 1, width - 1, height - 1);

  //saveFrame("frame-#####.tif");
  Frames++;
  //if (Frames > 30 * 20) {
  //  exit();
  //}
}
