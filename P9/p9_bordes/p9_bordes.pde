/**
 * Edge Detection
 * 
 * Change the default shader to apply a simple, custom edge detection filter.
 * 
 * Press the mouse to switch between the custom and default shader.
 */

PShader edges;  
import processing.video.*;

Capture cam;
PImage img;
boolean enabled = true;
    
void setup() {
  size(640, 480, P2D);
  //Cámara
  cam = new Capture(this, width , height);
  cam.start();
  
  edges = loadShader("edges.glsl");
}

void draw() {
  if (enabled)
   shader(edges);
  
   if (cam.available()) {
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
