float t = 0;
float xpos;
float ypos;
float r;

public void setup() {
  size(300,300);
}

void draw() {
  background(255);
  for(int x = 0 ; x < 11; x++) {
    for (int y = 0; y < 11; y++) {
      xpos = 30*x+15*sin(t);
      ypos = 30*y+15*cos(t);
      fill(map(sin(t),-1,1,0,255),map(x,0,11,0,255),map(noise(t),0,1,0,255),map(noise(t+100),0,1,0,255));
      float sd = 6000; // 3000
      r = 15*sin(t)*50*exp(-(pow(150-xpos,2)+pow(150-ypos,2))/sd);
      ellipse(xpos,ypos,r,r);
    }
  }
  t += 0.05;
  /*
  if (frameCount % 2 == 0) {
    saveFrame("f####.gif");
  }
  if (frameCount == 1000) {
    exit();
  }
  */
}