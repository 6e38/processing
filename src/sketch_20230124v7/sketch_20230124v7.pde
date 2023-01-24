import java.util.Date;

int Frames = 0;
int iterations = 1;
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
    color c = color(0.65, 0.6, 0.4 + (float)i * 0.04);
    //splotchers.add(new Splotcher(c, new Orbit(300, 3, 0, new Orbit(150, -7, 0, null))));
    splotchers.add(new Splotcher(c, new Orbit(300, 4, 0, new Orbit(150, -5, 0, null))));
  }

  g = createGraphics(1080, 1920);
  g.beginDraw();
  g.colorMode(HSB, 1);
  g.background(0.65, 0.05, 0.9);

  g.noStroke();
  g.fill(0, 0, 0.3);
  g.pushMatrix();
  g.translate(width * 0.25 + random(50), height / 2.0 + random(150));
  g.rotate(random((float)Math.PI / 8.0) - (float)Math.PI / 16.0);
  PFont f = createFont("Alegreya-Regular.otf", 90);
  g.textFont(f);
  g.text(new Date() + "\n\nTo whom it may concern,\n\nIt has been brought to our attention\nkindly cease and desist\nfuther actions taken", 0, 0);
  g.popMatrix();

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
    saveFrame("frame2-#####.tif");
  }

  noStroke();
  fill(0, 0, 1);
  textAlign(RIGHT);
  textSize(50);
  text(String.format("%.03fs, %05df", t, Frames), width, 50);

  Frames++;
  if (Capture && t >= 28.0) {
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
