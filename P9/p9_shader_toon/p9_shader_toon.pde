/**
 * Adaptado desde ejemplo Toon Shading.
 * 
 * Example showing the use of a custom lighting shader in order  
 * to apply a "toon" effect on the scene. Based on the glsl tutorial 
 * from lighthouse 3D:
 * http://www.lighthouse3d.com/tutorials/glsl-tutorial/toon-shader-version-ii/
 */
 
PShader toon1, toon2;
int modo = 0,modomax = 2;  

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
  toon2 = loadShader("ToonFrag.glsl", "ToonVert.glsl");
  toon1 = loadShader("ToonFrag1.glsl", "ToonVert.glsl");
}

void draw() {
  if (modo == 1) {
    shader(toon1);
  }
    else{
      if (modo == 2) {
      shader(toon2);
    }
  }
  
  //Dibuja esfera
  noStroke(); 
  background(0); 
  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2, height/2);
  sphere(120);
}  

void mousePressed() {
  //Si había un shader activo, lo resetea
  if (modo>0) resetShader();
  
  modo++;
  if (modo > modomax) modo = 0;
}
