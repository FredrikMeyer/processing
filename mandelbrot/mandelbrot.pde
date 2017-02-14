float ox; // origin
float oy;
float x1 = 1.5; //1.2; // height and width of first octant
float y1 = 1.5; //1.2;
Complex addition = new Complex(-0.5, 0); // center of screen

public void setup() {
  size(600, 600);
  ox = width/2;
  oy = ox;
  colorMode(HSB, 360, 100, 100);
}

int k = 100;
public void draw() {
  background(255);
  drawMandelbrot(k);
  println(frameCount);
  println("" + toComplex(new double[]{width, 0})); 
  saveFrame("mandelk###.jpg");
  //k++;
  noLoop();
}

void mousePressed() {
  addition = toComplex(new double[]{mouseX, mouseY});
  x1 = 0.3*x1;
  y1 = 0.3*y1;
  loop();
}

void drawMandelbrot(int iters) {
  // first find color to each pixel
  // then draw
  double[][] colors = new double[width][height];
  double maxnorm = 0;
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < width; j++) {
      double n = checkMandelbrot(i, j, iters);
      colors[i][j] = n;
      if (n > maxnorm) {
        maxnorm = n;
      }
    }
  }
  for (int i=0; i < width; i++) {
    for (int j = 0; j < width; j++) {
      float nn = (float)colors[i][j];
      if (nn > 0) {
        stroke(map(-nn, -(float)maxnorm, 0, 0, 360), 100, 100);
        point(i, j);
      } else {
        stroke(0);
        point(i, j);
      }
    }
  }
}

void drawGrid() {
  // draw coordinate system
}

double checkMandelbrot(int i, int j, int noIterations) {
  Complex c = toComplex(new double[]{i, j});
  double p = Math.sqrt(Math.pow((c.x-0.25), 2)+c.y*c.y);
  if ((c.x < p - 2*p*p+0.25) && (Math.pow((c.x+1), 2)+c.y*c.y) < 1./16) {
    return 0;
  }
  Complex z = new Complex(0, 0);
  double k = 0;
  while (k < noIterations) {
    z = iterate(z, c);
    if (z.normSquared() >= 4) {
      break;
    }
    k++;
  }
  if (k < noIterations) {
    double logzn = Math.log(z.norm()*z.norm());
    double nu = Math.log(logzn / Math.log(2))/Math.log(2);
    k = k + 1 - nu;
  }
  double color1 = Math.floor(k);
  double color2 = Math.floor(k)+1;
  double fracPart = k % 1;
  if (k == noIterations) {
    return 0;
  }
  return Math.log(((color2-color1)*fracPart + color1));
}

Complex iterate(Complex z, Complex c) {
  Complex zz =z.copy();
  zz.mult(z);
  
  zz.add(c);
  return zz;
}

Complex iterateShip(Complex z, Complex c) {
  Complex zz = new Complex(Math.abs(z.x), Math.abs(z.y));
  zz.mult(zz);
  zz.add(c);
  return zz;
}

double[] toPixel(Complex c) {
  // translates a complez number to a position on
  // screen
  // (ox,oy) = the origin on screen (in terms of pixels)
  double px = (c.x*(width-ox)/x1 + ox);
  double py = (-c.y*oy/y1 + oy);
  return new double[]{px, py};
}

Complex toComplex(double[] v) { 
  double a = x1*(v[0]-ox)/(width-ox);
  double b = y1*(oy-v[1])/oy;
  return new Complex(a + addition.x, b + addition.y);
}