class Catcher {
  PVector loc;
  int d;

  Catcher() {
    loc = new PVector(mouseX, height-d);
    d = 30;
  }

  void display() {
    ellipse(loc.x, loc.y, d, d);
  }

  void update() {
    loc.set(mouseX, height-d);
  }
}
