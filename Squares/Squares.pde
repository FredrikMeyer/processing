int counter;
int incr;

public void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(0);
  counter = 0;
  incr = 1;
}

int cc = 0;

public void draw() {
  background(0);
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
      drawSquare(20+30*i, 20+30*j, counter);
    }
  }
  if (counter > 50) {
    incr = -1;
  }
  if (counter < 0) {
    incr = 1;
  }
  counter = counter + incr;
  if (cc < 100) {
    saveFrame("pic###.gif");
  }
  cc++;
}

public void drawSquare(float x, float y, int i) {
  //fill(100);
  fill(x/5, 100, 100);
  rect(x, y, 20*sin(2*PI*i*y/(60.*500)), 20);
}