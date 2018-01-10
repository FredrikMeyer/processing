import java.util.Arrays;
import java.util.List;
import java.util.Collections;


ArrayList<int[]> points;

void setup() {
  size(800, 800);
  background(200, 200, 200);
  noLoop();

  points = new ArrayList<int[]>();
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      int[] point = {30*i, 30*j};
      points.add(point);
    }
  }
}

void draw() {
  ArrayList<List<int[]>> perms = permutations(points);
  Collections.shuffle(perms);
  int c = 0;
  for (int x = 0; x < 10; x++) {
    for (int y = 0; y < 10; y++) {
      sixCircles(80*x+20, 80*y+10, perms.get(c));
      //System.out.println(printPoints(perms.get(c)) + "..." + c);
      c++;
    }
  }
  saveFrame("result.png");
}


/* (x,y) is upper corner  */
void sixCircles(int x, int y, List<int[]> points) {
  stroke(100, 100, 100);
  fill(100, 100, 100);
  ellipse(x, y, 10, 10);

  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 3; j++) {
      ellipse(x + 30*i, y + 30*j, 10, 10);
    }
  }
  drawThroughPoints(x, y, points);
}

void drawThroughPoints(int x, int y, List<int[]> list) {
  int s = list.size();
  for (int i = 0; i < s - 1; i++) {
    strokeWeight(2);
    line(x+list.get(i)[0], y+list.get(0)[1], x+list.get(i+1)[0], y+list.get(i+1)[1]);
  }
}

public <T> ArrayList<List<T>> permutations(List<T> list) {
  if (list.size() <= 1) {
    ArrayList<List<T>> toRet = new ArrayList<List<T>>();
    toRet.add(list);
    return toRet;
  }
  ArrayList<List<T>> permutationsOfSubList = permutations(list.subList(1,list.size()));
  ArrayList<List<T>> toRet = new ArrayList<List<T>>();
  
  for (int i = 0; i < list.size(); i++) {
    for (List<T> I : permutationsOfSubList) {
      toRet.add(putiInBefore(i, list.get(0), I));
    }
  }
  return toRet;
}

public <T> ArrayList<T> putiInBefore(int i, T a, List<T> list) {
  ArrayList<T> res = new ArrayList<T>();
  int j = 0;
  for (; j < i; j++) {
    res.add(list.get(j));
  }
  res.add(a);
  j++;
  for (; j < list.size()+1; j++) {
    //toRet[j] = list[j-1];
    res.add(list.get(j-1));
  }
  return res;
}

public String printPoints(List<int[]> pts) {
  StringBuilder sb = new StringBuilder();
  for (int[] P : pts) {
    sb.append(String.format("[%s,%s]", P[0], P[1])); 
  }
  return sb.toString();
}