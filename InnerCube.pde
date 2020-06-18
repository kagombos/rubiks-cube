class InnerCube {
  ArrayList<Square> squares;
  
  InnerCube() {
    color col = color(60);
    this.squares = new ArrayList<Square>();
    for (int x = 0; x < 4; x++) {
      squares.add(new Square(0, 0, col, 0.5*x, 0, 49));
    }
    squares.add(new Square(0, 0, col, 0, 0.5, 49));
    squares.add(new Square(0, 0, col, 0, -0.5, 49));
  }
  
  void display() {
    for (Square square : squares) {
      square.display();
    }
  }
}
