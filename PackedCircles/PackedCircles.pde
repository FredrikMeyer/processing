void setup() {
  size(650, 650);
}

int i = 1; 
public void draw() {
  drawEverything(300);
  saveFrame("pic###.png");
  i++;
  if (i >= 10) {
    noLoop();
  }
}

public void drawEverything(int noCircles) {
  Circle[] circles = new Circle[noCircles];
  background(0);
  noFill();
  stroke(255);
  circles[0] = new Circle(250, width/2, height/2);
  for (int k = 1; k < noCircles; k++) {
    circles[k] = placeCircle(circles, k-1);
    circles[k].draw();
  }
}

// goes through the list up to index i. Returns
// a new circle not overlapping any other circles.
// circles: list of circles, index of last non-null circle
public Circle placeCircle(Circle[] circles, int i) {
  Circle firstCircle = circles[0];
  float firstR = firstCircle.getRadius();
  // Initial guess at center
  float r = random(0, firstR);
  float theta = random(0, 2*PI);
  float X = firstCircle.getX() + r*cos(theta);
  float Y = firstCircle.getY() + r*sin(theta);
  // first: find (X,Y) not lying in any other circles
  while (isInsideOtherCircle(circles, i, X, Y)) {
    theta = random(0, 2*PI);
    r = random(0, firstR);
    X = firstCircle.getX() + r*cos(theta);
    Y = firstCircle.getY() + r*sin(theta);
  }
  float maxR;
  float maxRadius = firstR;
  float distanceToCenter;
  // find distance to nearest circle
  for (int k = 1; k <= i; k++) {
    distanceToCenter = dist(circles[k].getX(), circles[k].getY(), X, Y);
    maxR = distanceToCenter - circles[k].getRadius();
    maxRadius = min(maxR, maxRadius);
  }
  // Return a new circle tangent to the nearest circle
  return new Circle(maxRadius, X, Y);
}

// Checks if the given center (x,y) is inside any other circles up to and including index i.
// (ignores the starting circle)
public boolean isInsideOtherCircle(Circle[] circles, int i, float x, float y) {
  for (int j = 1; j <= i; j++) {
    if (circles[j].isInside(x, y)) {
      return true;
    }
  }
  return false;
}


class Circle {
  float radius;
  float x;
  float y;

  public Circle(float r, float x_, float y_) {
    x = x_;
    y = y_;
    radius = r;
  }

  public void draw() {
    fill(0);
    ellipse(x, y, 2*radius, 2*radius);
  }

  public float getRadius() {
    return radius;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  // True if (X,Y) is inside self.
  public boolean isInside(float X, float Y) {
    boolean ret = false;
    float dist2 =  dist(x, y, X, Y);
    if (dist2 <= radius ) {
      ret = true;
    }
    return ret;
  }
}