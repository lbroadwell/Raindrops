int score = 0;
int scoreSize = 20;
int oldTime =0;
int currentTime = 0;
int TimeChange = 0; 
int index = 0;
boolean start;
boolean end;
boolean win; 
int rx, ry, rh, rw;
int lives = 3;
int score = 0; 
Raindrop[] r = new Raindrop[100];
Catcher c;

void setup() {
  size(500, 500);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop(); // every new raindrop is part of the array
  } 
  c = new Catcher();
  textSize(scoreSize);
  start=false;
  end=false;
  win=false;
  rx=10; 
  ry=10; 
  rh=25; 
  rw=50;
}

void draw() {
  if (start == false && end == false && win == false) { // makes the start screen appear
    background(180, 2, 160);
    fill(0);
    text("Raindrop Game", width/2, height/2);
    rect(rx, ry, rh, rw);
  }
  if (start == true && stop == false && win == false) {
    background(9, 5, 64);
    for (int i = 0; i < index; i++) {
      r[i].display();
      r[i].drop();
      c.update(r[i]);
      if (r[i].loc.y >= height) {
        lives-=1;
        r[i].loc.set(width*10, -height);
        r[i].vel.set(0, 0);
      }
    }
    fill(255);
    textAlign(CORNER);
    text("Lives:" + lives, 0, height-scoreSize*1.15); //displays current lives on screen
    text(score, width-scoreSize*1.25, height-scoreSize*1.15); //displays current score on screen
  }
}
if (lives <= 0) { 
    stop = true;
}
c.display(); //makes the catcher appear
currentTime = millis();
TimeChange = currentTime - oldTime;
if (TimeChange >= 2000) { //2000 milliseconds = 2 seconds. The differences between the current time and the old time is the time change. This means a new drop will fall every two seconds. 
  if (index < r.length) {
    index++;
    oldTime = currentTime;
  }
}
text(" "+score, 50, 50);
if (start==true) { 
  for (int i = 0; i < index; i++) {
    r[i].display();
    r[i].drop();
    c.update(r[i]);
  }
}

