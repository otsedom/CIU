PImage img;

void setup() {
  size(600, 600, P3D);
  img = loadImage("logoulpgc.png");
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  rotateX(radians(360*mouseX/width));
  rotateY(radians(360*mouseY/height));
  textureMode(NORMAL);
  beginShape(TRIANGLE_STRIP);
  texture(img);
  vertex(-100, -300, 0, 0, 0);
  vertex( 100, -300, 0, 1, 0);
  vertex(-100, -100, 0, 0, 1);
  vertex( 100, -100, 0, 1, 1);  
  vertex(-100,  100, 0, 0, 0);
  vertex( 100,  100, 0, 1, 0);    
  endShape();
}
