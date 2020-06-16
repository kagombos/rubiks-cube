
int currentX;
int currentY;
int staticX = -1;
int staticY = -1;

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
          part.rotate(0, 0, currentRot/400);
        }
      }
    }
  }
  
  background(200, 200, 150);
  translate(width/2, height/2);
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
    rotator.add(cube.autoRotate(Face.F, true), Face.F);
  }
  if (keyCode == DOWN) {
    rotator.add(cube.autoRotate(Face.F, false), Face.F);
  }
  if (key == '1') {
    rotator.add(cube.autoRotate(Face.F, true), Face.F);
  }
  if (key == '2') {
    rotator.add(cube.autoRotate(Face.R, true), Face.R);
  }
  if (key == '3') {
    rotator.add(cube.autoRotate(Face.L, true), Face.L);
  }
}
