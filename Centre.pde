class Centre extends CubePart {
  Square square;
  
  Centre(float x, float y, float z, Square square) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotx = x;
    this.roty = y;
    this.rotz = z;
    this.square = square;
  }

  
  void display() {
    pushMatrix();
        
    rotateX(PI*posx);
    rotateY(PI*posy);
    rotateZ(PI*posz);
    
    translate(100*x, 100*y, 100*z);
    if (rotx != 0) {
      rotateY(PI*rotx/2);
    }
    if (roty != 0) {
      rotateX(-PI*roty/2);
    }
    if (rotz != 0) {
      rotateX(PI*(1 - rotz)/2);
    }
    square.display();
  
    popMatrix();
  }
}
