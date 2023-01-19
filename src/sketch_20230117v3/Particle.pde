
class Particle {
  
  float x;
  float y;
  float pi2 = (float)Math.PI * 2.0;
  float p = random(1.0);
  float mag = (p * 0.3 + 0.3) * width;
  float period = 4.0 + 4.0 * p;
  float diameter = random(10) + 5;
  float yOffset = random(height);
  float periodOffset = random(pi2);
  float lastX = 0;
  boolean foreground = true;
  
  Particle() {
    lastX = (float)Math.sin(0 * pi2 / period + periodOffset) * mag;
  }
  
  void update(float time) {
    x = (float)Math.sin(time * pi2 / period + periodOffset) * mag;
    if (x > lastX) {
      foreground = true;
    } else {
      foreground = false;
    }
    lastX = x;
    y = yOffset + 0.1 * x;
  }
  
  void draw(color c, boolean foreground) {
    if (this.foreground == foreground) {
      if (foreground) {
        fill(c);
      } else {
        fill(c & 0xffffff | 0x88000000);
      }
      noStroke();
      ellipse(x, y, diameter, diameter);
    }
  }
}
