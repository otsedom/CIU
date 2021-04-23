/**
 * Adaptado desde ejemplo básico de iluminación por píxel de https://processing.org/tutorials/pshader/
 * 
 */
 
PShader sh;

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  sh = loadShader("lightfrag.glsl", "lightvert.glsl");
}

void draw() {
  if (mousePressed)
      shader(sh);
  else
      resetShader();
  
  //Dibuja esfera sin iluminación aplicada
  background(0);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  translate(width/2, height/2);
  sphere(120);
}  
