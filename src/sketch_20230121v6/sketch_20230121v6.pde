
Rocker rocker;

int Frames = 0;
int iterations = 10;
float Rate = 30;
boolean Capture = false;

ArrayList<Drawer> drawers = new ArrayList<>();
PGraphics g;

void setup() {
  size(1080, 1920);
  frameRate(Rate);
  
  rocker = new Rocker("6e38-rounded-border.png", 100, 100, 150, 150);
  
  for (int i = 0; i < 10; i++) {
    drawers.add(new Drawer(new Orbit(900.0, 96.0, 0, new Orbit((500 + i * 25), -60, 0, null))));
  }

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
  
  float t = (1.0 / Rate) * Frames;

  g.beginDraw();
  g.translate(width / 2.0, height / 2.0);

  for (int i = 0; i < iterations; i++) {
    for (Drawer d : drawers) {
      d.draw(g);
    }
  }
  g.endDraw();
  image(g, 0, 0);
  rocker.draw(t);

  if (Capture) {
    saveFrame("frame-#####.tif");
  }

  noStroke();
  fill(0, 0, 1);
  textAlign(RIGHT);
  textSize(50);
  text(String.format("%05d", Frames), width, 50);

  Frames++;
  if (Capture && Frames >= 2000) {
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
