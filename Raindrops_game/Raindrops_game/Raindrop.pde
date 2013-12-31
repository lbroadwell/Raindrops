class Raindrop {
  PVector loc;
  PVector vel;
  PVector acc;
  int d;
  PImage img;
  Raindrop() {
    d = 10;
    loc = new PVector(random(width), d/2); 
    vel = new PVector(0, random(1, 3)); //You have to make the velocity of each raindrop different, so that they don't fall all at once. 
    acc = new PVector(0,0);
    img=loadImage ("raindrop.png"); //The picture of the raindrop is loaded here.
  }

  void display() {
    for (int x=0; x<50; x+=1) {
      noStroke();
      image(img, loc.x, loc.y, d, d); //This is what is making the raindrop appear. 
    }
  }
  void drop() { //This function is actually making the raindrops fall. 
    vel.add(acc); 
    loc.add(vel);
  }
}

