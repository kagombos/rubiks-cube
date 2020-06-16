class Corner extends CubePart {
  ArrayList<Square> squares;
  
  Corner(float x, float y, float z, ArrayList<Square> squares) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = x;
    this.roty = y;
    this.rotz = z;
    this.squares = squares;
  }
  
  Corner(float x, float y, float z, Square square1, Square square2, Square square3) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = x;
    this.roty = y;
    this.rotz = z;
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
    
    float rot = 3*(roty - 1)/2 - (rotz - 1)/2;
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    if (rotx == 1) {
      rotateX(-abs(PI*0.5*rot));
    }
    else {
      rotateY(-PI*0.5);
      rotateZ(abs(PI*0.5*rot));
      
    }
    squares.get(0).display();
    popMatrix();
    
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    if (rotx == 1) {
      rotateX(-abs(PI*0.5*rot));
    }
    else {
      rotateY(-PI*0.5);
      rotateZ(abs(PI*0.5*rot));
      
    }
    rotateX(-PI*0.5);
    squares.get(1).display();
    popMatrix();
    
    pushMatrix();
    translate(100*x, 100*y, 100*z);
    if (rotx == 1) {
      rotateX(-abs(PI*0.5*rot));
    }
    else {
      rotateY(-PI*0.5);
      rotateZ(abs(PI*0.5*rot));
    }
    rotateY(PI*0.5);
    squares.get(2).display();
    popMatrix();
    
    
    popMatrix();
  }
}
