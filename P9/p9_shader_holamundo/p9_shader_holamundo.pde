PShader sh;

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  sh = loadShader("Colorea.glsl");
}

void draw() {
  if (mousePressed)
      shader(sh);
  else
      resetShader();
  
  background(0);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2, height/2);
  sphere(120);
}
