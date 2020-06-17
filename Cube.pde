class Cube {
  CubePart[][][] cubeArray;
  
  Cube() {
    cubeArray = new CubePart[3][3][3];
    
    Square white = new Square(0, 0, color(255, 255, 255), 0, 0);
    Square red = new Square(0, 0, color(255, 0, 0), 0, 0.5);
    Square orange = new Square(0, 0, color(255, 165, 0), 0, 1);
    Square yellow = new Square(0, 0, color(255, 255, 0), 0, -0.5);
    Square blue = new Square(0, 0, color(0, 0, 255), 0.5, 0);
    Square green = new Square(0, 0, color(0, 255, 0), -0.5, 0);
    
    cubeArray[0][0][0] = new Corner(1, 1, 1, white, green, red);
    cubeArray[0][0][1] = new Edge(0, 1, 1, white, green);
    cubeArray[0][0][2] = new Corner(-1, 1, 1, yellow, green, white);
    cubeArray[0][1][0] = new Edge(1, 0, 1, white, red);
    cubeArray[0][1][1] = new Centre(0, 0, 1, white);
    cubeArray[0][1][2] = new Edge(-1, 0, 1, yellow, white);
    cubeArray[0][2][0] = new Corner(1, -1, 1, white, blue, red);
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
  
  void swap(CubePart part1, CubePart part2, boolean right) {
    int mod = -1;
    if (right) {
      mod = 1;
    }
    for (int a = 0; a < part1.squares.size(); a++) {
      part1.squares.set(a, part2.squares.get(a));
    }
    part1.rotx += part1.posx;
    part1.roty += part1.posy;
    part1.rotz += part1.posz;
    part1.posx = 0;
    part1.posy = 0;
    part1.posz = 0;
  }
  
  void rotateFace(Face face, boolean right) {
    CubePart temp;
    CubePart tempCorner;
    CubePart tempEdge;
    
    switch(face) {
      case F:
        //corners
        temp = cubeArray[0][0][0];
        tempCorner = new Corner(temp.x, temp.y, temp.z, temp.squares.get(0), temp.squares.get(1), temp.squares.get(2));
        tempCorner.posx = temp.posx;
        tempCorner.posy = temp.posy;
        tempCorner.posz = temp.posz;
        swap(cubeArray[0][0][0], cubeArray[0][2][0], right);
        swap(cubeArray[0][2][0], cubeArray[0][2][2], right);
        swap(cubeArray[0][2][2], cubeArray[0][0][2], right);
        swap(cubeArray[0][0][2], tempCorner, right);
        //edges
        temp = cubeArray[0][0][1];
        tempEdge = new Edge(temp.x, temp.y, temp.z, temp.squares.get(0), temp.squares.get(1));
        tempEdge.posx = temp.posx;
        tempEdge.posy = temp.posy;
        tempEdge.posz = temp.posz;
        swap(cubeArray[0][0][1], cubeArray[0][1][0], right);
        swap(cubeArray[0][1][0], cubeArray[0][2][1], right);
        swap(cubeArray[0][2][1], cubeArray[0][1][2], right);
        swap(cubeArray[0][1][2], tempEdge, right); 
        break;
      case R:
        //corners
        temp = cubeArray[2][0][0];
        tempCorner = new Corner(temp.x, temp.y, temp.z, temp.squares.get(0), temp.squares.get(1), temp.squares.get(2));
        tempCorner.posx = temp.posx;
        tempCorner.posy = temp.posy;
        tempCorner.posz = temp.posz;
        swap(cubeArray[2][0][0], cubeArray[2][2][0], right);
        swap(cubeArray[2][2][0], cubeArray[0][2][0], right);
        swap(cubeArray[0][2][0], cubeArray[0][0][0], right);
        swap(cubeArray[0][0][0], tempCorner, right);
        //edges
        temp = cubeArray[1][0][0];
        tempEdge = new Edge(temp.x, temp.y, temp.z, temp.squares.get(0), temp.squares.get(1));
        tempEdge.posx = temp.posx;
        tempEdge.posy = temp.posy;
        tempEdge.posz = temp.posz;
        swap(cubeArray[1][0][0], cubeArray[2][1][0], right);
        swap(cubeArray[2][1][0], cubeArray[1][2][0], right);
        swap(cubeArray[1][2][0], cubeArray[0][1][0], right);
        swap(cubeArray[0][1][0], tempEdge, right); 
        break;
      default:
        println("whoa");
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
