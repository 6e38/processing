void setup() {
  size(1080, 1920);
  background(220);
  frameRate(10);
}

int w = 60;
int h = w;

int nx = 18;
int ny = 32;

void draw() {
  int x = int(random(nx));
  int y = int(random(ny));

  noStroke();
  fill(32, 32, 32, random(255));

  rect(x * w, y * h, w, h);
}
