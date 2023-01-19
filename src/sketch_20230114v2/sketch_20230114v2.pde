ArrayList<Ball> balls = new ArrayList<>();

int FrameCount = 0;
float FrameRate = 30;

void setup() {
  size(1080, 1920);
  background(0);
  frameRate(FrameRate);
  
  colorMode(HSB, 1);
  
  float ballSize = 200;
  float line = 96;
  for (int i = 0; i * line < height; i++) {
    float periodOffset = 0.01;
    float period = 1.81 + periodOffset * i;
    float hue = i * line / height;
    float mag = width * (0.025 + 0.025 * i);
    balls.add(new Ball(0, i * line, period, mag, ballSize, color(hue, 0.7, 1)));
    System.out.println("This is your period " + period);
  }
}

void draw() {
  scale(0.4);

  background(0, 0, 0);
  
  stroke(0, 255, 0);
  noFill();
  rect(1, 1, width - 2, height - 2);

  translate(width / 2.0, 20);

  fill(0, 255, 0);
  noStroke();
  rect(0, 0, 10, 10);
  
  for (Ball ball : balls) {
    ball.update(1 / FrameRate * FrameCount);
    ball.draw();
  }

  //saveFrame("frame-#####.tif");
  FrameCount++;
  if (FrameCount > 30 * 30) {
    exit();
  }
}
