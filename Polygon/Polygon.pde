float radius = 270;
int n = 24;

void setup() {
  size(600, 600);
  background(0);
  ellipseMode(RADIUS);
}

int counter = 1;
void draw() {
  background(0);
  frameRate(10);
  stroke(255);
  noFill();
  ellipse(width/2, height/2, radius, radius);
  text("n = " + n, 20, 20);
  text("d = " + counter, 20, 40);
  drawPoints(n);
  drawLines(n,counter);
  if (counter > n) counter = 0;
  //if (counter <= n) saveFrame("pic###.png");
  counter ++;
}


// draw n equidistant points on a circle of radius radius
void drawPoints(int n) {
  for (int i = 0; i < n; i++) {
    stroke(255);
    fill(100);
    ellipse(width/2 + radius * cos(2*PI*i/n), height/2 + radius * sin(2*PI*i/n), 5, 5);
  }
}

// draw lines between regularly spaced points with
// step size d
void drawLines(int n, int d) {
  int f = n/gcd(d, n);
  float x1 = width/2 + radius;
  float y1 = height/2;
  for (int i = 1; i <= f; i++) {
    stroke(255);
    float x2 = width/2 + radius * cos(2*PI*(d*i)/n);
    float y2 = height/2 + radius * sin(2*PI*(d*i)/n);
    line(x1, y1, x2, y2);
    x1 = width/2 + radius * cos(2*PI*d*i/n);
    y1 = height/2 + radius * sin(2*PI*i*d/n);
  }
}

int gcd(int a, int b) {
  int c;
  while (a != 0) {
    c = a;
    a = b % a;
    b = c;
  }
  return b;
}