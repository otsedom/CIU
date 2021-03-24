/**
 * Mosaico cámara web*/

PShader sh;  
import processing.video.*;

Capture cam;
PImage img;
boolean enabled = true;
    
void setup() {
  size(640, 480, P2D);
  //Cámara
  cam = new Capture(this, width , height);
  cam.start();
  
  sh = loadShader("mosaic.glsl");
}

void draw() {
  if (enabled)
   shader(sh);
  
   if (cam.available()) {
    sh.set("u_resolution", float(width), float(height));
    sh.set("u_mouse", float(mouseX), float(mouseY));
    sh.set("u_time", millis() / 1000.0);
    background(0);
    cam.read();
    image(cam, 0, 0);
   }
}
    
void mousePressed() {
  enabled = !enabled;
  if (!enabled == true) {
    resetShader();
  }
}
