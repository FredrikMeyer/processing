public class KochLine {
  PVector start;
  PVector end;

  KochLine(PVector a, PVector b) {
    start = a.copy();
    end   = b.copy();
  }

  void display() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }

  PVector kochA() {
    return start;
  }

  PVector kochB() {
    PVector diff = PVector.sub(end, start);
    diff.div(3);
    diff.add(start);
    return diff;
  }

  PVector kochC() {
    PVector v = PVector.sub(end,start);
    v.div(3);
    v.rotate(radians(-60));
    PVector a = this.kochB();
    a.add(v);
    return a;
  }

  PVector kochD() {
    PVector diff = PVector.sub(end, start);
    diff.mult(2./3);
    diff.add(start);
    return diff;
  }

  PVector kochE() {
    return end;
  }
}