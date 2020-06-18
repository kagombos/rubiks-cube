class CubePart {
  float x, y, z;
  float posx = 0, posy = 0, posz = 0;
  float rotx, roty, rotz;
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
}
