import java.util.Date;

int Frames = 0;
int iterations = 6;
float Rate = 30;
boolean Capture = false;

ArrayList<Splotcher> splotchers = new ArrayList<>();
int round = 0;
PGraphics g;

void setup() {
  size(1080, 1920);
  frameRate(Rate);

  colorMode(HSB, 1);

  for (int i = 0; i < 1; i++) {
    float angle = -(float)Math.PI / 2.0;
    color c = color(0, 0, 1, 0);
    //splotchers.add(new Splotcher(c, new Orbit(300, 3, 0, new Orbit(150, -7, 0, null))));
    splotchers.add(new Splotcher(c, new Orbit(300, 15, angle, new Orbit(200, -18, angle, null))));
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
    if (round < splotchers.size()) {
      boolean running = splotchers.get(round).draw(g);
      if (!running) {
        round++;
      }
    }
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
  text(String.format("%.03fs, %05df", t, Frames), width, 50);

  Frames++;
  if (Capture && t >= 9.0) {
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
