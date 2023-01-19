
ArrayList<Particle> particles;
ArrayList<Nucleus> nucleus;
int Frames = 0;
float Rate = 30;
float hue = 0;

void setup() {
  size(1080, 1920);
  frameRate(Rate);
  
  particles = new ArrayList<>();
  for (int i = 0; i < 3000; i++) {
    particles.add(new Particle());
  }
  
  nucleus = new ArrayList<>();
  for (int i = 0; i < 5; i++) {
    nucleus.add(new Nucleus());
  }
}

void center(float time) {
  pushMatrix();
  
  float y = (float)Math.sin(time * Math.PI * 2.0 / 16.0) * 50;
  
  stroke(0, 0, 0.8);
  strokeWeight(30);
  fill(0, 0, 0.85);
  translate(0, height / 2.0 - y);
  rotate(-time * (float)Math.PI * 2.0 / 8.0);
  rect(-200, -200, 400, 400, 100);
  
  strokeWeight(1);
  noStroke();
  fill(0, 0, 1);
  textSize(400);
  textAlign(CENTER);
  text("+", 0, 400 * 0.35);
  
  popMatrix();
}

void draw() {
  //scale(0.4);
  colorMode(HSB, 1);
  background(0, 0, 0.85);
  
  //ellipse(width / 2.0, height / 2.0, width * 0.2, width * 0.25);
  
  stroke(0, 0, 0);
  noFill();
  rect(-1, -1, width + 1, height + 1);

  translate(width / 2.0, 0);
  
  float t = 1.0 / Rate * Frames;
  
  color c = color(hue, 0.4, 0.6);
  hue += 0.01;
  while (hue > 1) {
    hue -= 1;
  }
  
  for (Particle p : particles) {
    p.update(t);
    p.draw(c, false);
  }
  
  //center(t);
  for (Nucleus n : nucleus) {
    n.update(t);
    n.draw();
  }
  
  for (Particle p : particles) {
    p.draw(c, true);
  }
  
  saveFrame("frame-#####.tif");
  Frames++;
  if (Frames > 30 * 20) {
    exit();
  }
}
