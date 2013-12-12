int score = 0; 
int scoreSize = 20;
int oldTime =0;
int currentTime = 0;
int TimeChange = 0; 
int index = 0;
Raindrop[] r = new Raindrop[100];
Catcher c;

void setup() {
  size(500,500);
  for (int i = 0; i < r.length; i++) {
    r[i] = new Raindrop(); // every new raindrop is part of the array 
  } 
  c = new Catcher();
  textSize(scoreSize);
}

void draw() {
  background(9,5,64);
  for (int i = 0; i < index; i++) {
    r[i].display();
    r[i].drop();
    c.update(r[i]);
  } 
  c.display(); //makes the catcher appear
  currentTime = millis();
  TimeChange = currentTime - oldTime;
  if(TimeChange >= 2000) { //2000 milliseconds = 2 seconds. The differences between the current time and the old time is the time change. This means a new drop will fall every two seconds. 
    if(index < r.length) {
      index++;
      oldTime = currentTime;
    }
  }
  text(" "+score,50,50);
}

