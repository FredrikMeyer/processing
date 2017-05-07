float fac1 = 3;//2.1718281828459045;
float fac2 = 7; //pow(2.1718281828459045,2);
float fac3 = 1; //pow(2.1718281828459045,2);

void setup() {
  size(500, 500);
  background(0);
  smooth();
  colorMode(HSB, 100);
  stroke(255);
  noFill();
} 

int t = 1;
float theta = 0;
Circle C = new Circle(250, 250, 200);
Circle D, E, F, G;
ArrayList<Float> centersX = new ArrayList<Float>();
ArrayList<Float> centersY = new ArrayList<Float>();


void draw() {
  background(0);
  theta = 2*PI * t /200;
  C.draw();
  D = C.tangentCircleAt(theta, 256);
  E = D.tangentCircleAt(fac1*theta, 128);
  F = E.tangentCircleAt(fac2*theta, 64);
  G = F.tangentCircleAt(fac3*theta, 32);
  E.draw();
  D.draw();
  F.draw();
  G.draw();
  centersX.add(G.getX());
  centersY.add(G.getY());
  for (int i = 1; i < centersX.size(); i++) {
    float lineStartX = centersX.get(i-1);
    float lineStartY = centersY.get(i-1);
    float lineEndX = centersX.get(i);
    float lineEndY = centersY.get(i);
    stroke(0, 100, 100);
    strokeWeight(2);
    line(lineStartX, lineStartY, lineEndX, lineEndY);
  }
  t++;
  if (t % 3 == 0) {
  saveFrame("circle###.png");
  }
  if (t > 220) {
    noLoop();
  }
}

class Circle {
  private float x;
  private float y;
  private float radius;

  public Circle(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
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

  public void draw() {
    pushMatrix();
    translate(x, y);
    strokeWeight(2);
    stroke(30, 100, 40, 80);
    ellipse(0, 0, 2*radius, 2*radius);
    popMatrix();
  }

  // return a circle tangent to this at angle theta (inside)
  public Circle tangentCircleAt(float theta, float R) {
    float newX = this.x + (this.radius - R)*cos(theta);
    float newY = this.y + (this.radius - R)*sin(theta);
    return new Circle(newX, newY, R);
  }
}