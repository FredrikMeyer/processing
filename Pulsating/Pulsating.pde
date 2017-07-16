void setup() {
  size(400, 400);
  rectMode(CENTER);
}


float t = 0;
void draw() {
  background(0);
  drawSquares(10, t);
  t += 1;
}

public void drawSquares(int n, float t) {
  float squareWidth = width/(2*n+1);
  float radius;
  for (float x = squareWidth; x < width-squareWidth; x += 2*squareWidth) {
    for (float y = squareWidth; y < width-squareWidth; y += 2*squareWidth) {
      radius = abs(sin(t/60))*squareWidth;
      fill(50, 100, 250);
      drawSquare(x,y, radius, PI*t/60.);
      drawSquare(x+squareWidth, y + squareWidth, radius, PI*t/60. + PI);
      radius = abs(squareWidth-radius);
      fill(250, 100, 50);
      ellipse(x+squareWidth, y, radius, radius);
      ellipse(x, y+squareWidth, radius, radius);
    }
  }
}

public void drawSquare(float x, float y, float radius, float angle) {
      pushMatrix();
      translate(x, y);
      rotate(angle);
      rect(0, 0, radius, radius);
      popMatrix();
}