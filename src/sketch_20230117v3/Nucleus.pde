
class Nucleus {
  
  float x;
  float y;
  float pi2 = (float)Math.PI * 2.0;
  float mag = 50;
  float period = 5.0;
  float diameter = 200;
  float yOffset = random(50) + height / 2.0 - 25;
  float periodOffset = random(pi2);
  float yConst = random(0.6) - 0.3;
  
  Nucleus() {
  }
  
  void update(float time) {
    x = (float)Math.sin(time * pi2 / period + periodOffset) * mag;
    y = yOffset + yConst * x;
  }
  
  void draw() {
    fill(0, 0, 1);
    noStroke();
    ellipse(x, y, diameter, diameter);
    fill(0, 0, 1, 0.5);
    ellipse(x, y, diameter + 40, diameter + 40);
    fill(0, 0, 1, 0.25);
    ellipse(x, y, diameter + 80, diameter + 80);
  }
}
