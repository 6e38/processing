import java.util.Date;

int Frames = 0;
float Rate = 30;
float Scale = 0.4;
boolean Capture = true;

Path path;

void setup() {
  size(1080, 1920);
  frameRate(Rate);

  colorMode(HSB, 1);

  path = new Path();
  //noLoop();
}

void draw() {
  scale(Scale);

  noFill();
  stroke(0, 0, 1);
  strokeWeight(8);
  rect(0, 0, width, height);

  float t = (1.0 / Rate) * Frames;

  path.draw(t);

  if (Capture) {
    path.saveFrame("frame-%06d.png");
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

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  x = int((float)x / Scale);
  y = int((float)y / Scale);
  path.point(x, y);
}

void keyPressed() {
  if (key == ' ') {
    noLoop();
  } else if (key == 'c') {
    loop();
  } else if (key == 'q') {
    exit();
  } else if (key == 'n') {
    redraw();
  }
}
