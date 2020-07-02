class Square {
  PShape square;
  float x, y;
  float rotx, roty;
  color col;
  
  Square(float x, float y, color col, float rotx, float roty, int size) {
    square = createShape();
    square.beginShape();
    square.fill(col);
    square.vertex(-size, -size,  size);
    square.vertex( size, -size,  size);
    square.vertex( size,  size,  size);
    square.vertex(-size,  size,  size);
    square.endShape(CLOSE);
    this.x = x;
    this.y = y;
    this.rotx = rotx;
    this.roty = roty;
    this.col = col;
  }
  
  void display() {
    pushMatrix();
    rotateX(PI*rotx);
    rotateY(PI*roty);
    translate(x, y);
    shape(square);
    line(-1000, 0, 0, 1000, 0, 0);
    line(0, -1000, 0, 0, 1000, 0);
    line(0, 0, -1000, 0, 0, 1000);
    popMatrix();
  }
}
