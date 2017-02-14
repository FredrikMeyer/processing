float currentX = 250;
float currentY = 250;
float initialIncr = 15;
float incr = initialIncr;
float minIncr = 5;
float maxRadius = 500;

public void setup() {
  size(500, 500);
  background(255);
  colorMode(HSB, 360, 100, 100);
}

int t = 0;
void draw() {
  if (t % 100 == 0) {
    //saveFrame("f#####.gif");
    print(t);
  }
  if (t == 10000) {
    exit();
  }
  float radius = sqrt(pow(250-currentX, 2)+ pow(250-currentY, 2));
  //fill(map(sin(t/150),-1,1,0,360), -100/110 * radius + 100, 100);
  PVector newpos = nyPos(radius, currentX, currentY, 35, t);
  float prevX = currentX;
  float prevY = currentY;
  currentX = newpos.x;
  currentY=  newpos.y;
  stroke(map(sin(t/50), -1, 1, 0, 360), -100/110 * radius + 100, 100);
   ellipse(currentX,currentY, 10,10);
  line(prevX, prevY, currentX, currentY);
  strokeWeight(2);
  t++;
}

PVector nyPos(float r, float x, float y, float incr, int t) {
  float angle = atan2(y-250, x-250);
  float widthInterval = 2*PI*sqrt(1-r*r/(maxRadius*maxRadius));
  noiseDetail(2,0.1);
  int randomChoice = 1; // int(random(2));
  float randomNr;
  if (randomChoice == 0) {
    randomNr = map(noise(2*t), 0, 1, -widthInterval/2, widthInterval/2);
  }
  else {
    randomNr = random(-widthInterval/2, widthInterval/2);
  }
  //float randomNr = random(-widthInterval/2, widthInterval/2);
  float newAngle = randomNr+angle+PI;
  float newX = x + incr*cos(newAngle);
  float newY = y + incr*sin(newAngle);
  return new PVector(newX, newY);
}