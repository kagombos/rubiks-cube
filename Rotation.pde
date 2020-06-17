class Rotation {
  Axis axis;
  float value;
  
  Rotation(Axis axis, float value) {
    this.axis = axis;
    this.value = value;
  }
}

enum Axis {
  X,
  Y,
  Z
}
