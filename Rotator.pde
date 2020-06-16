import java.util.*;

class Rotatable {
  CubePart part;
  int x;
  int y;
  int z;
  int count = 0;
  int max;
  boolean right;
  
  Rotatable(CubePart part, int x, int y, int z, boolean right) {
    this.part = part;
    this.x = x;
    this.y = y;
    this.z = z;
    this.right = right;
    this.max = 30;
  }
  
  Rotatable(CubePart part, int x, int y, int z, boolean right, int max) {
    this.part = part;
    this.x = x;
    this.y = y;
    this.z = z;
    this.right = right;
    this.max = max;
  }
}

class Rotator {
  ArrayList<Rotatable> list;
  boolean running;
  Face face;
  boolean right;
  
  Rotator() {
    list = new ArrayList<Rotatable>();
    running = false;
    face = null;
  }
  
  void add(ArrayList<Rotatable> newList, Face face) {
    for (Rotatable newRot : newList) {
      if (!running) {
        list.add(newRot);
        this.face = face;
        this.right = newRot.right;
      }
    }
    running = true;
    println(list.size());
  }
  
  boolean rotate(Cube cube) {
    Iterator<Rotatable> iter = list.iterator();
    while(iter.hasNext()) {
      Rotatable rotated = iter.next();
      int mod = 1;
      if (!rotated.right) {
        mod = -1;
      }
      float rotx = (float)(mod * rotated.x)/(rotated.max * 2);
      float roty = (float)(mod * rotated.y)/(rotated.max * 2);
      float rotz = (float)(mod * rotated.z)/(rotated.max * 2);
      rotated.part.autoRotate(rotx, roty, rotz);
      rotated.count++;
      if(rotated.count >= rotated.max) {
        iter.remove();
        rotated.part.set(rotated.part.x, rotated.part.y, rotated.part.z);
      }
    }
    if (list.size() == 0 && face != null) {
      running = false;
      cube.rotateFace(face, right);
      face = null;
    }
    return !running;
  }
}
