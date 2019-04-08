PShader toon;

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  //Carga del shader
  toon = loadShader("ToonFrag.glsl", "ToonVert.glsl");
  //Parámetro
  toon.set("fraction", 1.0);
}

void draw() {
  toon.set("resolution", float(width), float(height));
  toon.set("time", millis() / 1000.0);
  toon.set("mouse", float(mouseX), float(mouseY));
  
  
  //Activa o no el shader por defecto
  if (mousePressed)
      shader(toon);
  else
      resetShader();
  
  background(0);
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2, height/2);
  sphere(120);
}
