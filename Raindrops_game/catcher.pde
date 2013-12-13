class Catcher {
  PVector loc;
  int d;

  Catcher() {
    d = 30;
    loc = new PVector(mouseX, height-d); //Allows you to control the catcher.
  }

  void display() {
    loc.x=mouseX;
    ellipse(loc.x, loc.y, d, d);
  }

  void update(Raindrop m) { //sets raindrop back to zero 
    loc.set(mouseX, height-d);
    if (loc.dist(m.loc) < d/2 + m.d/2) { //This makes sure the timer/score only increases when the raindrop hits the catcher. 
      m.loc.set(width*10, height*10);
      m.vel.set(0, 0);
      score++; //increases score
    }
  }
}

