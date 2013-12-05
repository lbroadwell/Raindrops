Raindrop[] r = new Raindrop[100];
Catcher catcher;

void setup() {
  size(500,700);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
  } 
  catcher = new Catcher();
}

void draw() {
  background(200,230,255);
  for (int i = 0; i < r.length; i++) {
    r[i].display();
    r[i].drop();
  } 
  catcher.display();
  catcher.update();
}

