int score = 0; 
int scoreSize = 20;
int oldTime =0;
int currentTime = 0;
int TimeChange = 0; 
int index = 0;
Raindrop[] r = new Raindrop[100];
Catcher c;

void setup() {
  size(500, 700);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop();
  } 
  c = new Catcher();
  textSize(scoreSize);
  text(score,height-scoreSize*1.25, width-scoreSize*1.25);
}

void draw() {
  background(0,0,255);
  for (int i = 0; i < index; i++) {
    r[i].display();
    r[i].drop();
    c.update(r[i]);
  } 
  c.display();
  currentTime = millis();
  TimeChange = currentTime - oldTime;
  if(TimeChange >= 2000) {
    if(index < r.length) {
      index++;
      oldTime = currentTime;
    }
  }
  text(" "+score,50,50);
}

