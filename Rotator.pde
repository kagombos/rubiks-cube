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
  FaceDir face;
  boolean right;
  
  Rotator() {
    list = new ArrayList<Rotatable>();
    running = false;
    face = null;
  }
  
  void add(ArrayList<Rotatable> newList, FaceDir face) {
    for (Rotatable newRot : newList) {
      if (!running) {
        list.add(newRot);
        this.face = face;
        this.right = newRot.right;
      }
    }
    running = true;
  }
  
  boolean rotate(Cube cube) {
    Iterator<Rotatable> iter = list.iterator();
    while(iter.hasNext()) {
      Rotatable rotated = iter.next();
      float posx = (float)(rotated.x)/(rotated.max * 2);
      float posy = (float)(rotated.y)/(rotated.max * 2);
      float posz = (float)(rotated.z)/(rotated.max * 2);
      rotated.part.autoRotate(posx, posy, posz);
      rotated.count++;
      if(rotated.count >= rotated.max) {
        iter.remove();
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
