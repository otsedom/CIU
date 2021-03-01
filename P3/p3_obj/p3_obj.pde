PShape obj;

void setup() {
  size(600, 600, P3D);
  obj = loadShape("lamp.obj");
}

void draw() {
  background(255);
  translate(mouseX,mouseY,0);
  scale(30);
  rotateX(radians(180));
  shape(obj);
}
