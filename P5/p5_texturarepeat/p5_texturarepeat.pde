PImage img;

void setup() {
  size(640, 360, P3D);
  img = loadImage("logoulpgc.png");
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(img);  
  vertex(-100, -100, 0, 0, 0);
  vertex( 100, -100, 0, 2, 0);
  vertex( 100,  100, 0, 2, 2);
  vertex(-100,  100, 0, 0, 2);
  endShape();
}
