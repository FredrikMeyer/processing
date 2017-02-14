
void setup() {
  size(800, 800);
}

void draw() {
  int level = frameCount;
  SBox B = new SBox(width, 0, 0, level, true);
  B.show();
  saveFrame("sierpinski###.jpg");
  if (frameCount == 8) {
  noLoop();
  }
}

class SBox {
  float w;
  float x;
  float y;
  int level;
  SBox[] subboxes = new SBox[9];
  boolean black;

  SBox(float width_, float x_, float y_, int level_, boolean black_) {
    w = width_;
    x = x_;
    y = y_;
    level = level_;
    black = black_;
    if (level > 0 && black == true) {
      int count = 0;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (i != 1 || j != 1) {
            subboxes[count] = new SBox(w/3, x+i*w/3, y+j*w/3, level-1, true);
          } else {
            subboxes[count] = new SBox(w/3, x+i*w/3, y+j*w/3, level-1, false);
          }
          count++;
        }
      }
    }
  }

  void show() {
    fill(0);
    if (!black) {
      fill(255);
    }
    noStroke();
    rect(x, y, w, w);
    if (level >= 0) {
      for (int i = 0; i < 9; i++) {
        if (subboxes[i] != null) {
          subboxes[i].show();
        }
      }
    }
  }
}