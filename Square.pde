class Square {
  PShape square;
  float x, y;
  float rotx, roty;
  
  Square(float x, float y, color col, float rotx, float roty) {
    square = createShape();
    square.beginShape();
    square.fill(col);
    square.vertex(-50, -50,  50);
    square.vertex( 50, -50,  50);
    square.vertex( 50,  50,  50);
    square.vertex(-50,  50,  50);
    square.endShape(CLOSE);
    this.x = x;
    this.y = y;
    this.rotx = rotx;
    this.roty = roty;
  }
  
  void display() {
    pushMatrix();
    rotateX(PI*rotx);
    rotateY(PI*roty);
    translate(x, y);
    shape(square);
    popMatrix();
  }
}
