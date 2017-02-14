class Complex {
  double x;
  double y;
  
  Complex(double x_, double y_) {
    x = x_;
    y = y_;
  }
  
  @Override
  public String toString() {
    return String.valueOf(x) + "+i" + String.valueOf(y);
  }
  
  // adds c to self
  void add(Complex other) {
    x = x + other.x;
    y = y + other.y;
  }
  
  // squares this number
  void square() {
    double old_x = x;
    double old_y = y;
    x = old_x*old_x - old_y*old_y;
    y = 2*old_x * old_y;
  }
  
  // returns square of length
  double lengthSq() {
    return x*x+y*y;
  }
}