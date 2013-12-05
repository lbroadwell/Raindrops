color c =color(0);

void setup() {
  size(500,500);
  textSize(50);
  textAlign(CENTER);
}

void draw() {
  background(c);
  if(frameCount%200 == 0){
    c=color(random(255), random(255), random(255));
  }
  text(frameCount, width/2, height/2);
}
