class Catcher {
  PVector loc;
  int d;
  PImage image;

  Catcher() {
    d = 30;
    loc = new PVector(mouseX, height-d);
    image = loadImage("umbrella.png");
  }

  void display() {
    loc.x=mouseX;
    image(image, loc.x, loc.y, d, d);
  }

  void update(Raindrop m) { //sets raindrop back to zero 
    loc.set(mouseX, height-d);
    if (loc.dist(m.loc) < d/2 + m.d/2) {
      m.loc.set(width*10, height*10);
      m.vel.set(0, 0);
      score++; //increases score 
    }
  }
}
}

