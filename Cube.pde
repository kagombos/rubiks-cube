class Cube {
  CubePart[][][] cubeArray;
  
  Cube() {
    cubeArray = new CubePart[3][3][3];
    
    Square white = new Square(0, 0, color(255, 255, 255));
    Square red = new Square(0, 0, color(255, 0, 0));
    Square orange = new Square(0, 0, color(255, 165, 0));
    Square yellow = new Square(0, 0, color(255, 255, 0));
    Square blue = new Square(0, 0, color(0, 0, 255));
    Square green = new Square(0, 0, color(0, 255, 0));
    
    cubeArray[0][0][0] = new Corner(1, 1, 1, white, green, red);
    cubeArray[0][0][1] = new Edge(0, 1, 1, white, green);
    cubeArray[0][0][2] = new Corner(-1, 1, 1, yellow, green, white);
    cubeArray[0][1][0] = new Edge(1, 0, 1, white, red);
    cubeArray[0][1][1] = new Centre(0, 0, 1, white);
    cubeArray[0][1][2] = new Edge(-1, 0, 1, yellow, white);
    cubeArray[0][2][0] = new Corner(1, -1, 1, blue, white, red);
    cubeArray[0][2][1] = new Edge(0, -1, 1, blue, white);
    cubeArray[0][2][2] = new Corner(-1, -1, 1, yellow, white, blue);
    
    cubeArray[1][0][0] = new Edge(1, 1, 0, green, red);
    cubeArray[1][0][1] = new Centre(0, 1, 0, green);
    cubeArray[1][0][2] = new Edge(-1, 1, 0, yellow, green);
    cubeArray[1][1][0] = new Centre(1, 0, 0, red);
    cubeArray[1][1][1] = null;
    cubeArray[1][1][2] = new Centre(-1, 0, 0, yellow);
    cubeArray[1][2][0] = new Edge(1, -1, 0, red, blue);
    cubeArray[1][2][1] = new Centre(0, -1, 0, blue);
    cubeArray[1][2][2] = new Edge(-1, -1, 0, blue, yellow);
    
    cubeArray[2][0][0] = new Corner(1, 1, -1, green, orange, red);
    cubeArray[2][0][1] = new Edge(0, 1, -1, green, orange);
    cubeArray[2][0][2] = new Corner(-1, 1, -1, yellow, orange, green);
    cubeArray[2][1][0] = new Edge(1, 0, -1, red, orange);
    cubeArray[2][1][1] = new Centre(0, 0, -1, orange);
    cubeArray[2][1][2] = new Edge(-1, 0, -1, orange, yellow);
    cubeArray[2][2][0] = new Corner(1, -1, -1, orange, blue, red);
    cubeArray[2][2][1] = new Edge(0, -1, -1, orange, blue);
    cubeArray[2][2][2] = new Corner(-1, -1, -1, yellow, blue, orange);
  }
  
  void display() {
    for (CubePart[][] row : cubeArray) {
      for (CubePart[] column : row) {
        for (CubePart part : column) {
          if (part != null) {
            part.display();
          }
        }
      }
    }
  }
  
  void swap(int z, int y, int x, CubePart part) {
    part.x = 1 - x;
    part.y = 1 - y;
    part.z = 1 - z;
    part.rotx = part.x;
    part.roty = part.y;
    part.rotz = part.z;
    cubeArray[z][y][x] = part;
  }
  
  void rotateFace(Face face, boolean right) {
    switch(face) {
      case F:
        //corners
        CubePart temp = cubeArray[0][0][0];
        swap(0, 0, 0, cubeArray[0][2][0]);
        swap(0, 2, 0, cubeArray[0][2][2]);
        swap(0, 2, 2, cubeArray[0][0][2]);
        swap(0, 0, 2, temp);
        //edges
        temp = cubeArray[0][0][1];
        swap(0, 0, 1, cubeArray[0][1][0]);
        swap(0, 1, 0, cubeArray[0][2][1]);
        swap(0, 2, 1, cubeArray[0][1][2]);
        swap(0, 1, 2, temp); 
        break;
      default:
        break;
    }
    println("swapped");
  }
  
  ArrayList<Rotatable> autoRotateParts(int x, int y, int z, boolean right) {
    ArrayList<Rotatable> list = new ArrayList<Rotatable>();
    for (int a = 0; a < 3; a++) {
      CubePart[][] face = cubeArray[a];
      if ((z == 0) || (z == 1 && a == 0) || (z == -1 && a == 2)) {
        for (int b = 0; b < 3; b++) {
          CubePart[] row = face[b];
          if ((y == 0) || (y == 1 && b == 0) || (y == -1 && b == 2)) {
            for (int c = 0; c < 3; c++) {
              CubePart part = row[c];
              if ((x == 0) || (x == 1 && c == 0) || (x == -1 && c == 2)) {
                if (part != null) {
                  list.add(new Rotatable(part, x, y, z, right));
                }
              }
            }
          }
        }
      }
    }
    return list;
  }
  
  ArrayList<Rotatable> autoRotate(Face face, boolean right) {
    ArrayList<Rotatable> list = new ArrayList<Rotatable>();
    switch(face) {
      case F:
        list = autoRotateParts(0, 0, 1, right);
        break;
      case R:
        list = autoRotateParts(1, 0, 0, right);
        break;
      case L:
        list = autoRotateParts(-1, 0, 0, right);
        break;
      default:
        break;
    }
    return list;
  }
}
