PImage img;

void setup() {
  size(640, 360, P3D);
  img = loadImage("logoulpgc.png");
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  textureMode(NORMAL);
  beginShape();
  texture(img);
  vertex(-100, -100, 0, 0,   0);
  vertex( 100, -100, 0, 1, 0);
  vertex( 100,  100, 0, 1, 1);
  vertex(-100,  100, 0, 0,   1);
  endShape();
}
