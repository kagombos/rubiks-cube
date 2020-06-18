class Edge extends CubePart {
  
  Edge(float x, float y, float z, ArrayList<Square> squares) {
    super();
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = 0;
    this.roty = 0;
    this.rotz = 0;
    this.squares = new ArrayList<Square>();
    for (Square square : squares) {
      this.squares.add(square);
    }
    this.squares = squares;
  }
  
  Edge(float x, float y, float z, Square square1, Square square2) {
    super();
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = 0;
    this.roty = 0;
    this.rotz = 0;
    this.squares = new ArrayList<Square>();
    this.squares.add(square1);
    this.squares.add(square2);
  }
  
  void display() {
    pushMatrix();
    
    rotateX(PI*posx);
    rotateY(PI*posy);
    rotateZ(PI*posz);
    
    translate(100*x, 100*y, 100*z);
    
    for (Rotation rot : rotations) {
      showRotation(rot);
    }
    
    innerCube.display();
    squares.get(0).display();
    squares.get(1).display();

    popMatrix();
  }
}
