float startradius = 300;

void setup() {
  size(600, 600);
  background(255);
}

int i = 0;
void draw() {
  background(255);
  drawKochSnowflake(i);
  noLoop();
}

void mousePressed() {
  i++;
  loop();
}

void drawKochSnowflake(int noIterations) {
  ArrayList<KochLine> lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, 200);
  PVector end = new PVector(width, 200);
  lines.add(new KochLine(start, end));
  start = new PVector(width,200);
  end = new PVector(width/2,600);
  lines.add(new KochLine(start,end));
  start = end.copy();
  end = new PVector(0,200);
  lines.add(new KochLine(start,end));

  for (int i = 0; i < noIterations; i++) {
    lines = kochGenerate(lines);
  }  
  
  for (KochLine l : lines) {
    l.display();
  }
}

public ArrayList<KochLine> kochGenerate(ArrayList<KochLine> lines) {
  ArrayList<KochLine> next = new ArrayList<KochLine>();
  for (KochLine l : lines) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();

    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
  return next;
}

void drawCircle(float x, float y, float radius) {
  stroke(0);
  fill(30+200/radius, 100, 30+200/radius, map(0, startradius, 0, 255, 150-radius));
  ellipse(x, y, radius, radius);
  if (radius > 10) {
    drawCircle(x-radius/2, y, radius/2);
    drawCircle(x+radius/2, y, radius/2);
    drawCircle(x, y+radius/2, radius/2);
    drawCircle(x, y-radius/2, radius/2);
  }
}