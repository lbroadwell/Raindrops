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
    textAlign(CENTER);
    textSize(50);
    text("Raindrop Game", width/2, height/2);
    rectMode(CENTER);
    rect(rx, ry, rh, rw);
    fill(0);
    textSize(40);
    text("START", width/2, height/2+50);
  }
  if (start == true && end == false && win == false) {
    background(9, 5, 64);
    for (int i = 0; i < index; i++) {
      r[i].display();
      r[i].drop();
      c.update(r[i]);
      if (r[i].loc.y >= height) {
        lives-=1; //states that if the raindrop is below the catcher that you lose one life
        r[i].loc.set(width*10, -height);
        r[i].vel.set(0, 0);
      }
    }
    fill(255);
    textAlign(CORNER);
    text("Lives:" + lives, 0, height-scoreSize*1); //puts the lives on screen
    text(score, width-scoreSize*1.25, height-scoreSize*1.15); //puts your score on the screen
  }
  c.display(); //makes the catcher appear
  currentTime = millis();
  TimeChange = currentTime - oldTime;
  if (TimeChange >= 2000) { 
    if (index < r.length) {
      index++;
      oldTime = currentTime;
    }
  }
  if (lives <= 0) { //states that if your lives reach zero, that you will be directed to the end screen
    end = true;
  }
  if (start == true && end == true && win == false) {//this initializes the end screen 
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    rectMode(CENTER);
    rect(rx, ry, rw, rh);
    textSize(10);
    text("try again?", 80, 25);
    textSize(50);
  }
  if (score >= 10) { //states that if your score reaches ten, then you go to the win screen
    win = true;
  }
  if (start == true && end == false && win == true) { //initializes the win screen
    background(0);
    fill(0, 255, 0);
    textAlign(CENTER);
    textSize(50);
    text("YOU WIN", width/2, height/2);
    textSize(10);
    text("Congratulations! You have completed the game that has taken me weeks to complete!", width/2 + 10, height/2 +10);
    text("Please appreciate it...", width/2 + 20, height/2 + 20);
    rectMode(CENTER);
    rect(rx, ry, rw+10, rh); 
    textSize(10);
    text("play again?", 80, 25);
    textSize(50);
  }
}
void mousePressed() { //these initialize the start and restart buttons when you click the button with your mouse
  if (start == true && end == true && win == false && mouseX>rx-rw/2 && mouseX<rx+rw/2 && mouseY>ry-rh/2 && mouseY<ry+rh/2) {
    lives = 3; 
    score = 0;
    end = false;
  }
  if (start == false && end == false && win == false && mouseX>rx-rw/2 && mouseX<rx+rw/2 && mouseY>ry-rh/2 && mouseY<ry+rh/2) {
    start = true;
  }
  if (start == true && end == false && win == true && mouseX>rx-rw/2-10 && mouseX<rx+rw/2+10 && mouseY>ry-rh/2 && mouseY<ry+rh/2) {
    lives = 3;
    score = 0;
    win = false;
  }
}

