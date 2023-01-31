int Number = 0;

class Dot {
  float x, y, r;
  boolean done, children;
  int number;
  
  Dot(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.done = false;
    this.children = false;
    Number++;
    this.number = Number;
  }
  
  void markDone() {
    done = true;
  }
  
  boolean isDone() {
    return done;
  }
  
  void markChildren() {
    children = true;
  }
  
  boolean hasChildren() {
    return children;
  }
  
  boolean hit(Dot o) {
    float xx = x - o.x;
    float yy = y - o.y;
    float rr = r + o.r;
    return rr * rr > xx * xx + yy * yy;
  }
  
  String toString() {
    return String.format("dot %6d (%4.2f, %4.2f, r%.0f)", number, x, y, r);
  }
}
