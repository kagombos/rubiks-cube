class CubePart {
  float x, y, z;
  float posx = 0, posy = 0, posz = 0;
  ArrayList<Square> squares;
  ArrayList<Rotation> rotations = new ArrayList<Rotation>();
  InnerCube innerCube;
  
  CubePart() {
    this.innerCube = new InnerCube();
  }
  
  void display() {};
  //void rotate(float x, float y, float z) {
  //  posx = x;
  //  posy = y;
  //  posz = z;
  //}
  
  void autoRotate(float x, float y, float z) {
    posx += x;
    posy += y;
    posz += z;
  }
  
  void set(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void showRotation(Rotation rot) {
    switch(rot.axis) {
      case X:
        rotateX(PI*rot.value);
        break;
      case Y:
        rotateY(PI*rot.value);
        break;
      case Z:
        rotateZ(PI*rot.value);
        break;
    }
  }
  
  color getForward() {
    println("posx:" + posx);
    println("posy:" + posy);
    println("posz:" + posz);
    float trotx = 0;
    float troty = 0;
    float trotz = 0;
    float temp;
    for (Rotation rot : rotations) {
      switch(rot.axis) {
        case X:
          trotx += rot.value;
          temp = troty;
          troty = trotz;
          trotz = temp;
          break;
        case Y:
          troty += rot.value;
          temp = trotx;
          trotx = trotz;
          trotz = temp;
          break;
        case Z:
          trotz += rot.value;
          temp = trotx;
          trotx = troty;
          troty = temp;
          break;
      }
    }
    for (Square square : squares) {
      //trotx += square.rotx;
      //troty += square.roty;
      println("trotx: "+ trotx);
      println("troty: "+ troty);
      println("trotz: "+ trotz);
      float test = trotx % 2;
      if (troty % 2 == test && trotz % 2 == test) {
        return square.col;
      }
      if (trotx %2 == 0 && troty % 2 == 0) {
        return square.col;        
      }
      //trotx -= square.rotx;
      //troty -= square.roty;
      println("trotx: "+ trotx);
      println("troty: "+ troty);
    }
    println("miss");
    return color(0);
  }
}
