class Face {
  ArrayList<CubePart> corners;
  ArrayList<CubePart> edges;
  
  Face(CubePart corner1, CubePart corner2, CubePart corner3, CubePart corner4, CubePart edge1, CubePart edge2, CubePart edge3, CubePart edge4) {
    this.corners = new ArrayList<CubePart>();
    this.corners.add(corner1);
    this.corners.add(corner2);
    this.corners.add(corner3);
    this.corners.add(corner4);
    this.edges = new ArrayList<CubePart>();
    this.edges.add(edge1);
    this.edges.add(edge2);
    this.edges.add(edge3);
    this.edges.add(edge4);
  }
}

enum FaceDir {
  F,
  B,
  R,
  L,
  U,
  D;
  
  FaceDir face(int x, int y, int z) {
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
