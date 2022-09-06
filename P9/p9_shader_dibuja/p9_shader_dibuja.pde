PShader sh;

void setup() {
  size(600, 600, P2D);
  noStroke();
  sh = loadShader("Dibuja0.glsl");  
}


void draw() {
  sh.set("u_resolution", float(width), float(height));
  sh.set("u_mouse", float(mouseX), float(mouseY));
  sh.set("u_time", millis() / 1000.0);
  shader(sh);
  rect(0,0,width,height);
}
