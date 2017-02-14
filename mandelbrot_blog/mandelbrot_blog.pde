// Define the coordinate system
double xmin = -2;
double xmax = 1;
double ymin = -1;
double ymax = 1;
int noIterations = 50;

double deltaX = xmax-xmin;
double deltaY = ymax-ymin;

public void setup() {
  // have width/height ratio same as deltaX/deltaY
  size(600, 400);
}

public void draw() {
  background(255);
  drawCoordinateAxes();
  drawMandelbrot();
  saveFrame("mandel_blog.jpg");
  noLoop();
}

// Iterates through the coordinate system
// Checks if (i,j) is in the Mandelbrot set
public void drawMandelbrot() {
  stroke(0);
  for (int i=0; i < width; i++) {
    for (int j = 0; j < width; j++) {
      if (checkMandelbrot(i, j, noIterations)) {
        point(i, j);
      }
    }
  }
}

// Checks if (i,j) is in the Mandelbrot set
boolean checkMandelbrot(int i, int j, int noIterations) {
  Complex c = pixelToComplex(i, j);
  int k = 0;
  Complex z = new Complex(0, 0);
  while (k < noIterations) {
    iterate(z, c);
    if (z.lengthSq() >= 4) {
      return false;
    }
    k++;
  }
  return true;
}

// sends z -> z^2+c
public void iterate(Complex z, Complex c) {
  z.square();
  z.add(c);
}

// Converts pixels to a complex number
Complex pixelToComplex(int a, int b) {
  double x = deltaX *a/ width + xmin;
  double y = -deltaY * b/height +ymax;
  return new Complex(x, y);
}

double[] getOrigin() {
  double px = -xmin*width/deltaX;
  double py = ymax*height/deltaY;
  return new double[]{px, py};
}

public void drawCoordinateAxes() {
  double[] origin   = getOrigin();
  double xaxisStart = (origin[0]*0.1);
  double xaxisEnd   = (width-origin[0])*0.9+origin[0];
  double yaxisEnd   = origin[1]*0.1;
  double yaxisStart = (height-origin[1])*0.9+origin[1];
  line((float)xaxisStart, (float)origin[1], (float)xaxisEnd, (float)origin[1]);
  line((float)origin[0], (float)yaxisStart, (float)origin[0], (float)yaxisEnd);
}