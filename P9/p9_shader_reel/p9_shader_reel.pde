PShape obj;
float ang;
PShader sh[];
PImage img;
int modo = 0,modomax = 8;  

void setup() {
  size(640, 360, P3D);
  img = loadImage("logoulpgc.png");
  
  sh = new PShader[8];   
  sh[0] = loadShader("FragBasic.glsl", "ColorVert.glsl");
  sh[1] = loadShader("ColorFrag.glsl", "ColorVert.glsl");
  //Con textura
  sh[2] = loadShader("TexFragBasic.glsl", "TexVert.glsl");
  //Con la textura pixelada
  sh[3] = loadShader("TexFrag1.glsl", "TexVert.glsl");
  //Por vértice, sólo recibe el color
  sh[4] = loadShader("FragBasic.glsl", "LightVert0.glsl");
  //Por píxel, recibe color, normal y luz
  sh[5] = loadShader("LightFrag1.glsl", "LightVert1.glsl");
  //Sólo color y tetxura
  sh[6] = loadShader("TexFragBasic.glsl", "TexLightVert0.glsl");
  //Color, textura, normal y luz
  sh[7] = loadShader("TexLightFrag1.glsl", "TexLightVert1.glsl");
  textureMode(NORMAL);
  beginShape();
  obj = createShape(SPHERE, 120);
  obj.setStroke(255); //Aristas con color de la esfera
  obj.setTexture(img);
  endShape();
}

void draw() {
  background(0);
  
  shader(sh[modo]);
  sh[modo].set("u_time", float(millis())/float(1000));  
  
  //Dibuja esfera
  pushMatrix();
  pointLight(255, 255, 255, width/2, height/2, 200);
  translate(width/2, height/2);
  rotateY(ang);
  shape(obj);
  ang += 0.005;
  popMatrix();
  
  resetShader();
  fill(255);
  textSize(20);
  text("Modo " + modo, 10, 30); 

}
void mousePressed() {
  resetShader();  
  if (mouseButton == LEFT){
    modo++;
    if (modo >= modomax) modo = 0;
  }
  else {
    if (mouseButton == RIGHT){
      modo--;
      if (modo < 0) modo = modomax-1;
    }
  }
  
}
