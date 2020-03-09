import processing.video.*;

PImage img;
Capture cam;

void setup() {
  size(800, 800, P3D);
  //Cámara
  cam = new Capture(this, 640 , 480);
  cam.start(); 
}

void draw() {  
  if (cam.available()) {
    background(0);
    cam.read();
    
    translate(width / 2, height / 2);
    rotateX(radians(mouseX/2));
    rotateY(radians(mouseY/2));
    textureMode(NORMAL);
    beginShape();
    texture(cam);
    vertex(-200, -200, 0, 0, 0);
    vertex( 200, -200, 0, 1, 0);
    vertex( 200,  200, 0, 1, 1);
    vertex(-200,  200, 0, 0, 1);
    endShape();
  }
}
