class Corner extends CubePart {
  
  Corner(float x, float y, float z, ArrayList<Square> squares) {
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
  
  Corner(float x, float y, float z, Square square1, Square square2, Square square3) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = 0;
    this.roty = 0;
    this.rotz = 0;
    this.squares = new ArrayList<Square>();
    this.squares.add(square1);
    this.squares.add(square2);
    this.squares.add(square3);
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
    
    //rotateZ(PI*rotz);
    //rotateY(PI*roty);
    //rotateX(PI*rotx);
    
    squares.get(0).display();
    squares.get(1).display();
    squares.get(2).display();
    
    popMatrix();
  }
}
