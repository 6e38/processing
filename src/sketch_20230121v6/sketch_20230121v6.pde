
Rocker rocker;

int Frames = 0;
int iterations = 10;
float Rate = 30;
boolean Capture = true;

ArrayList<Drawer> drawers = new ArrayList<>();
int round = 0;
PGraphics g;

void setup() {
  size(1080, 1920);
  frameRate(Rate);

  rocker = new Rocker("6e38-rounded-border.png", 100, 100, 150, 150);

  colorMode(HSB, 1);

  for (int i = 0; i < 12; i++) {
    color c = color(0.65, 0.6, 0.4 + (float)i * 0.04);
    float angle = (float)Math.PI * 2.0 * (1.0 / 360.0);
    drawers.add(new Drawer(c, new Orbit(250, 1, 0, new Orbit(250 + (i * 40), -7, angle * i, null))));
  }
  
  for (int i = 0; i < 9; i++) {
    color c = color(0.80, 0.4, 0.4 + (float)i * 0.04);
    float offset = (float)Math.PI / 8.0;
    float angle = (float)Math.PI * 2.0 * (1.0 / 360.0);
    drawers.add(new Drawer(c, new Orbit(80, 1, 0, new Orbit(80 + (i * 20), -7, offset + angle * i, null))));
  }

  g = createGraphics(1080, 1920);
  g.beginDraw();
  g.colorMode(HSB, 1);
  g.background(0.65, 0.05, 0.1);
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

  float t = (1.0 / Rate) * Frames;

  g.beginDraw();
  g.translate(width / 2.0, height / 2.0);

  for (int i = 0; i < iterations; i++) {
    if (round < drawers.size()) {
      boolean running = drawers.get(round).draw(g);
      if (!running) {
        round++;
      }
    }
    //for (Drawer d : drawers) {
    //  d.draw(g);
    //}
  }
  g.endDraw();
  image(g, 0, 0);
  //if (round < drawers.size()) {
  //  drawers.get(round).drawRadii();
  //}
  //rocker.draw(t);

  if (Capture) {
    saveFrame("frame-#####.tif");
  }

  noStroke();
  fill(0, 0, 1);
  textAlign(RIGHT);
  textSize(50);
  text(String.format("%.03fs, %05df", t, Frames), width, 50);

  Frames++;
  if (Capture && t >= 48.0) {
    noLoop();
  }
}

void keyPressed() {
  if (key == ' ') {
    noLoop();
  } else if (key == 'c') {
    loop();
  } else if (key == 'q') {
    exit();
  }
}
