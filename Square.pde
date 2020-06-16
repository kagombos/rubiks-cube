class Square {
  PShape square;
  float x, y;
  
  Square(float x, float y, color col) {
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
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    shape(square);
    popMatrix();
  }
}
