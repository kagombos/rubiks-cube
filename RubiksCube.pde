
int currentX;
int currentY;
int staticX = -1;
int staticY = -1;
int zoom;

float currentRot;
float rot = -1;
float time;

int rotateInterval = 3;

Cube cube;
Rotator rotator;

void setup() {
  size(800, 800, P3D);
  background(200, 200, 150);
  
  cube = new Cube();
  rotator = new Rotator();
  time = millis();
}

void draw() {
  if(mousePressed && mouseButton == RIGHT) {
    if (staticX == -1) {
      staticX = mouseX - currentX;
      staticY = currentY + mouseY;      
    }
    currentX = mouseX - staticX;
    currentY = staticY - mouseY;
  }
  else if (mousePressed && mouseButton == LEFT) {
    if (rot == -1) {
      rot = mouseX - currentRot;
    }
    currentRot = mouseX - rot;
    for (CubePart[] column : cube.cubeArray[0]) {
      for (CubePart part : column) {
        if (part != null) {
          //part.rotate(0, 0, currentRot/400);
        }
      }
    }
  }
  
  background(200, 200, 150);
  translate(width/2, height/2);
  translate(0, 0, zoom);
  rotateX(PI * currentY/500);
  rotateY(PI * currentX/500);
  
  if (millis() - time > rotateInterval) {
    rotator.rotate(cube);
    time = millis();
  }
  
  cube.display();
}

void mouseReleased() {
  staticX = -1;
  staticY = -1;
  rot = -1;
}

void mouseWheel(MouseEvent event) {
  int e = event.getCount();
  if(zoom < 200 || e == 1) {
    zoom -= e * 100;
  }
}

int selectX = 0;
int selectY = 0;
int selectZ = 0;

void keyPressed() {
  if (keyCode == LEFT) {
    for (CubePart[][] row : cube.cubeArray) {
      for (CubePart[] column : row) {
        for (CubePart part : column) {
          if (part != null) {
            part.x = part.x - 1;
          }
        }
      }
    }
  }
  if (keyCode == RIGHT) {
    for (CubePart[][] row : cube.cubeArray) {
      for (CubePart[] column : row) {
        for (CubePart part : column) {
          if (part != null) {
            part.x = part.x + 1;
          }
        }
      }
    }
  }
  if (keyCode == UP) {
    rotator.add(cube.autoRotate(FaceDir.F, true), FaceDir.F);
  }
  if (keyCode == DOWN) {
    rotator.add(cube.autoRotate(FaceDir.F, false), FaceDir.F);
  }
  if (key == '1') {
    rotator.add(cube.autoRotate(FaceDir.F, true), FaceDir.F);
  }
  if (key == '2') {
    rotator.add(cube.autoRotate(FaceDir.R, true), FaceDir.R);
  }
  if (key == '3') {
    rotator.add(cube.autoRotate(FaceDir.B, true), FaceDir.B);
  }
  if (key == '4') {
    rotator.add(cube.autoRotate(FaceDir.L, true), FaceDir.L);
  }
  if (key == '5') {
    rotator.add(cube.autoRotate(FaceDir.U, true), FaceDir.U);
  }
  if (key == '6') {
    rotator.add(cube.autoRotate(FaceDir.D, true), FaceDir.D);
  }
  if (key == '7') {
    CubePart temp = cube.cubeArray[selectZ][selectY][selectX];
    println("selectX: " + selectX);
    println("selectY: " + selectY);
    println("selectZ: " + selectZ);
    println("rotx: " + temp.rotx);
    println("roty: " + temp.roty);
    println("rotz: " + temp.rotz);
    for (Rotation rot : temp.rotations) {
      println(rot.axis + " " + rot.value);
    }
    //println("front color: " + hex(temp.getForward()));
  }
  if (key == '8') {
    selectX++;
    if (selectX > 2) {
      selectX = 0;
    }
  }
  if (key == '9') {
    selectY++;
    if (selectY > 2) {
      selectY = 0;
    }
  }
  if (key == '0') {
    selectZ++;
    if (selectZ > 2) {
      selectZ = 0;
    }
  }
  if (key == 'a') {
    CubePart temp = cube.cubeArray[selectZ][selectY][selectX];
    temp.squares.get(0).rotx = 0;
    temp.squares.get(0).roty = 0;
  }
}
