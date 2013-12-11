class Catcher {
  PVector cloc;
  int d;

  Catcher() {
    d = 30;
    cloc = new PVector(mouseX, height-d);
  }

  void display() {
    cloc.x=mouseX;
    ellipse(cloc.x, cloc.y, d, d);
  }

  void update(Raindrop m) {
    cloc.set(mouseX, height-d);
    if (cloc.dist(m.loc) < d/2 + m.d/2) {
      m.loc.set(width*10, height*10);
      m.vel.set(0, 0);
      score++;
    }
  }
}

