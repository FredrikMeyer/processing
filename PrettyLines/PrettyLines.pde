
void setup() {
  size(400, 400);
}

int c = 0;
void draw() {
  if (c <= 50) {
    background(0);
    pushMatrix();
    translate(400, 400);
    rotate(PI);
    drawLines(c);
    translate(-400, 400);
    popMatrix();
  }
  if (c > 50) {
    background(0);
    pushMatrix();
    translate(400, 400);
    rotate(PI);
    drawLines(50);
    translate(-400, 400);
    popMatrix();
    drawLines(c-50);
  }
  if (c > 100) noLoop();
  //saveFrame("###.gif");
  c++;
}

public void drawLines(int n) {
  for (float k = 1; k < n; k++) {
    stroke(255);
    //float[] pos1 = posToPixel(0,(n-k)/n);
    //float[] pos2 = posToPixel(-n*k/(n*n-n*k+k*k),0);
    line(0, 40*n/k, 400*n*k/(n*n-n*k+k*k), 0);
  }
}