float pi2 = (float)Math.PI * 2.0;

class Ball {
  float x = 0;
  float y = 0;
  float period = 0;
  float size = 0;
  float mag = 0;
  color c;
    
  Ball(float x, float y, float period, float mag, float size, color c) {
    this.x = x;
    this.y = y;
    this.period = pi2 / period;
    this.mag = mag;
    this.size = size;
    this.c = c;
  }
  
  void update(float time) {
    x = (float)Math.sin(time * period) * mag;
  }
  
  void draw() {
    noStroke();
    fill(c);
    ellipse(x, y, size, size);
  }
}
