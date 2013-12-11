class Raindrop {
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  PImage img;
  Raindrop() {
    d = 10;
    loc = new PVector(random(width), d/2); 
    vel = new PVector(0, random(1, 2));
    acc = new PVector(0, .01);
    img=loadImage ("raindrop.png");
  }

  void display() {
    for (int x=0; x<50; x+=1) {
      noStroke();
      image(img, loc.x, loc.y, d, d);
    }
  }
  void drop() {
    vel.add(acc);
    loc.add(vel);
  }
}

