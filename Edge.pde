class Edge extends CubePart {
  ArrayList<Square> squares;
  
  Edge(float x, float y, float z, ArrayList<Square> squares) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = x;
    this.roty = y;
    this.rotz = z;
    this.squares = squares;
  }
  
  Edge(float x, float y, float z, Square square1, Square square2) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = x;
    this.roty = y;
    this.rotz = z;
    this.squares = new ArrayList<Square>();
    this.squares.add(square1);
    this.squares.add(square2);
  }
  
  private void displayX() {
    float rot = -rotz*abs(roty + rotz - 2)/4 ;
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    rotateZ(PI*0.5);
    rotateY(PI*rot);
    squares.get(0).display();
    popMatrix();
    
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    rotateZ(PI*0.5);
    rotateY(PI*(rot + 0.5));
    squares.get(1).display();
    popMatrix();
  }
  
  private void displayY() {
    float rot = -rotz*abs(rotx + rotz - 2)/4 ;
    
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    rotateY(PI*rot);
    squares.get(0).display();
    popMatrix();
    
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    rotateY(PI*(rot + 0.5));
    squares.get(1).display();
    popMatrix();
  }
  
  private void displayZ() {
    float rot = -roty*abs(roty + rotx - 2)/4 ;
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    rotateX(-PI*0.5);
    rotateY(PI*rot);
    squares.get(0).display();
    popMatrix();
    
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    rotateX(-PI*0.5);
    rotateY(PI*(rot + 0.5));
    squares.get(1).display();
    popMatrix();
  }
  
  void display() {
    pushMatrix();
    
    rotateX(PI*posx);
    rotateY(PI*posy);
    rotateZ(PI*posz);
    
    if (rotx == 0) {
      this.displayX();
    }
    if (roty == 0) {
      this.displayY();
    }
    if (rotz == 0) {
      this.displayZ();
    }
    
    popMatrix();
  }
}
