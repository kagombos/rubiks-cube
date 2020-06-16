enum Face {
  F,
  B,
  R,
  L,
  U,
  D;
  
  Face face(int x, int y, int z) {
    if (z == 1) {
      return F;
    }
    else if (z == -1) {
      return B;
    }
    else if (y == 1) {
      return D;
    }
    else if (y == -1) {
      return U;
    }
    else if (x == 1) {
      return R;
    }
    else {
      return L;
    }
  }
}
