import java.util.*;

LinkedList<Square> squares;


void setup() {
  rectMode(CENTER);
  noFill();
  stroke(255);
  size(250, 250);
  background(0);
  squares = new LinkedList<Square>();
  squares.add(new Square(0));
}


int t = 0;
void draw() {
  background(0);
  for (Square s : squares) {
    s.draw();
    s.setSize(s.getSize() + 2);
  }
  if (t % 10 == 1) {
    squares.add(new Square(0));
    emptyListIfBigSquare();
  }
  saveFrames();
  t++;
}

void saveFrames() {
  if (t < 500) {
    if (t % 2 == 0) {
      saveFrame("f###.gif");
    }
  } else {
    noLoop();
  }
}

void emptyListIfBigSquare() {
  Iterator<Square> iter = squares.iterator();
  while (iter.hasNext()) {
    Square s = iter.next(); 
    if (s.getSize() > 1.5* width) {
      iter.remove();
    } else {
      break;
    }
  }
}
  


class Square {
  private float size;
  private float rotation = 0;
  
  public Square(float size) {
    this.size = size;
  }
  
  public void setSize(float size) {
    this.size = size;
  }
  
  public float getSize() {
    return this.size;
  }
  
  public void draw() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotation);
    rotation += 2*PI/300;
    fill(0);
    rect(0, 0, size, size);
    popMatrix();
  }
}