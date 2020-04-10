PShader sh;

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  sh = loadShader("ColoreaInput.glsl");
}

void draw() {
  if (mousePressed)
  {
      shader(sh);
      sh.set("u_resolution", float(width), float(height));
      sh.set("u_mouse", float(mouseX), float(mouseY));
      sh.set("u_time",float(millis())/float(1000)) ;
  }
  else
      resetShader();
  
  background(0);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2, height/2);
  sphere(120);
}
