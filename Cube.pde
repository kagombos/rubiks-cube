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
  
  void swap(CubePart part1, CubePart part2) {
    for (int a = 0; a < part1.squares.size(); a++) {
      part1.squares.set(a, part2.squares.get(a));
    }
    part1.rotations = part2.rotations;
    if(part1.posx != 0) {
      part1.rotations.add(0, new Rotation(Axis.X, part1.posx));
    }
    if(part1.posy != 0) {
      part1.rotations.add(0, new Rotation(Axis.Y, part1.posy));
    }
    if(part1.posz != 0) {
      part1.rotations.add(0, new Rotation(Axis.Z, part1.posz));
    }
    part1.posx = 0;
    part1.posy = 0;
    part1.posz = 0;
  }
  
  void rotate(Face face, boolean right) {
    ArrayList<CubePart> corners = face.corners;
    ArrayList<CubePart> edges = face.edges; 
    if (!right) {
      CubePart temp = corners.get(1);
      corners.set(1, corners.get(3));
      corners.set(3, temp);
      temp = edges.get(1);
      edges.set(1, edges.get(3));
      edges.set(3, temp);
    }
    CubePart tempCorner = new Corner(corners.get(0).x, corners.get(0).y, corners.get(0).z, corners.get(0).squares.get(0), corners.get(0).squares.get(1), corners.get(0).squares.get(2));
    tempCorner.rotations = corners.get(0).rotations;
    tempCorner.posx = corners.get(0).posx;
    tempCorner.posy = corners.get(0).posy; 
    tempCorner.posz = corners.get(0).posz;
    swap(corners.get(0), corners.get(1)); //<>//
    swap(corners.get(1), corners.get(2)); //<>//
    swap(corners.get(2), corners.get(3)); //<>//
    swap(corners.get(3), tempCorner); //<>//
    
    CubePart tempEdge = new Edge(edges.get(0).x, edges.get(0).y, edges.get(0).z, edges.get(0).squares.get(0), edges.get(0).squares.get(1));
    tempEdge.rotations = edges.get(0).rotations;
    tempEdge.posx = edges.get(0).posx;
    tempEdge.posy = edges.get(0).posy;
    tempEdge.posz = edges.get(0).posz;
    swap(edges.get(0), edges.get(1));
    swap(edges.get(1), edges.get(2));
    swap(edges.get(2), edges.get(3));
    swap(edges.get(3), tempEdge);
  }
  
  void rotateFace(FaceDir faceDir, boolean right) {
    
    switch(faceDir) {
      case F:
        Face face = new Face(
          cubeArray[0][0][0],
          cubeArray[0][2][0],
          cubeArray[0][2][2],
          cubeArray[0][0][2],
          cubeArray[0][0][1],
          cubeArray[0][1][0],
          cubeArray[0][2][1],
          cubeArray[0][1][2]);
        rotate(face, right);
        break;
      case R:
        face = new Face(
          cubeArray[2][0][0],
          cubeArray[2][2][0],
          cubeArray[0][2][0],
          cubeArray[0][0][0],
          cubeArray[1][0][0],
          cubeArray[2][1][0],
          cubeArray[1][2][0],
          cubeArray[0][1][0]);
        rotate(face, right);
        break;
      case B:
        face = new Face(
          cubeArray[2][0][2],
          cubeArray[2][2][2],
          cubeArray[2][2][0],
          cubeArray[2][0][0],
          cubeArray[2][0][1],
          cubeArray[2][1][2],
          cubeArray[2][2][1],
          cubeArray[2][1][0]);
        rotate(face, right);
        break;
      case L:
        face = new Face(
          cubeArray[0][0][2],
          cubeArray[0][2][2],
          cubeArray[2][2][2],
          cubeArray[2][0][2],
          cubeArray[1][0][2],
          cubeArray[0][1][2],
          cubeArray[1][2][2],
          cubeArray[2][1][2]);
        rotate(face, right);
        break;
        case U:
        face = new Face(
          cubeArray[0][2][0],
          cubeArray[2][2][0],
          cubeArray[2][2][2],
          cubeArray[0][2][2],
          cubeArray[0][2][1],
          cubeArray[1][2][0],
          cubeArray[2][2][1],
          cubeArray[1][2][2]);
        rotate(face, right);
        break;
        case D:
        face = new Face(
          cubeArray[2][0][0],
          cubeArray[0][0][0],
          cubeArray[0][0][2],
          cubeArray[2][0][2],
          cubeArray[2][0][1],
          cubeArray[1][0][0],
          cubeArray[0][0][1],
          cubeArray[1][0][2]);
        rotate(face, right);
        break;
      default:
        break;
    }
  }
  
  ArrayList<Rotatable> autoRotateParts(int x, int y, int z, boolean right) {
    ArrayList<Rotatable> list = new ArrayList<Rotatable>();
    int mod = 1;
    if (!right) {
      mod = -1;
    }
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
                  list.add(new Rotatable(part, mod*x, mod*y, mod*z, right));
                }
              }
            }
          }
        }
      }
    }
    return list;
  }
  
  ArrayList<Rotatable> autoRotate(FaceDir face, boolean right) {
    ArrayList<Rotatable> list = new ArrayList<Rotatable>();
    switch(face) {
      case F:
        list = autoRotateParts(0, 0, 1, right);
        break;
      case B:
        list = autoRotateParts(0, 0, -1, right);
        break;
      case R:
        list = autoRotateParts(1, 0, 0, right);
        break;
      case L:
        list = autoRotateParts(-1, 0, 0, right);
        break;
      case D:
        list = autoRotateParts(0, 1, 0, right);
        break;
      case U:
        list = autoRotateParts(0, -1, 0, right);
        break;
      default:
        break;
    }
    return list;
  }
}
