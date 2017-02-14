class Complex {
  double x;
  double y;

  /*
  * Class implementing arithmetic operations
  * with complex numbers.
  */
  Complex(double a, double b) {
    x = a;
    y = b;
  }
  
  @Override
  public String toString() {
    return String.valueOf(x) + "+i" + String.valueOf(y); 
  }

  Complex copy() {
    return new Complex(x, y);
  }

  void add(Complex c) {
    x = x + c.x;
    y = y + c.y;
  }

  void add(double r) {
    x = x + r;
  }

  void mult(Complex c) {
    double a = c.x;
    double b = c.y;
    double xx = x;
    double yy = y;
    x = a*xx - b*yy;
    y = a*yy + b*xx;
  }

  double norm() {
    return Math.sqrt(x*x+y*y);
  }
  
  double normSquared() {
    return x*x+y*y;
  }

  void conjugate() {
    y = -y;
  }
}