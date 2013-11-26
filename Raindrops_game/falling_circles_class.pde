int count = 1500;
PVector[] locs = new PVector[count];
PVector[] vels = new PVector[count];
float[] d = new float[count];
color[] c = new color[count];

void setup() {
  background(255);
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  for (int i = 0; i < count; i++) {
    locs[i] = new PVector(random(width), 0);
    d[i] = random(5,50);
    c[i] = color(random(360), 100, 100);
    vels[i] = new PVector(.02,random(.15,1));
  }
}

void draw() {
  for (int i = 0; i < count; i++) {
    fill(c[i]);
    strokeWeight(9);
    ellipse(locs[i].x, locs[i].y, d[i], d[i]);
    locs[i].add(vels[i]);
  }
}

