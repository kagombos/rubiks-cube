class Centre extends CubePart {
  
  Centre(float x, float y, float z, Square square) {
    super();
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = x;
    this.roty = y;
    this.rotz = z;
    this.squares = new ArrayList<Square>();
    this.squares.add(square);
  }

  
  void display() {
    pushMatrix();
        
    rotateX(PI*posx);
    rotateY(PI*posy);
    rotateZ(PI*posz);
    
    translate(100*x, 100*y, 100*z);
    innerCube.display();
    squares.get(0).display();
  
    popMatrix();
  }
}
