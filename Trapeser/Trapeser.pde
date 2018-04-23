int w = 10;
int h = 30;
int hAir = 10;
int vAir = 10;

void setup() {
  size(600,600);
}

void draw() {
  background(160,160,160);
  noLoop();
  
  float noOfHSquares = width / (w + hAir) - 1;
  float noOfVSquares = height / (h + vAir);
  print(noOfHSquares);
  print(noOfVSquares);
  
  for (int i = 0; i < noOfHSquares; i++) {
    for (int j = 0 ; j < noOfVSquares; j++) {
      float rightHeight = map(i, 0, noOfHSquares, 0,30); 
      float leftHeight = h-map(j, 0, noOfVSquares, 0,h);
      drawShape(10 + i*(w+vAir), 10 + j*(h+hAir), w, leftHeight, rightHeight);
    }
  }
}

void drawShape(float x, float y, float w, float h, float h2) {
  float midHeight = y+0.5*h;
  noFill();
  stroke(255);
  strokeWeight(1.5);
  beginShape();
  vertex(x,y);
  vertex(x,y+h);
  vertex(x+w,midHeight+0.5*h2);
  vertex(x+w,midHeight - 0.5*h2);
  vertex(x,y);
  endShape();
}
