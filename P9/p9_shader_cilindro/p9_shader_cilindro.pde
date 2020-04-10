PShape can;
float angle;
PShader shd;
PImage img;

void setup() {
  size(640, 360, P3D);
  img = loadImage("logoulpgc.png");
  can = createCan(100, 200, 32);
  shd = loadShader("ColorFrag0.glsl", "ColorVert0.glsl");
  //shd = loadShader("ColorFrag1.glsl", "ColorVert1.glsl");
  //shd = loadShader("TexFrag0.glsl", "TexVert0.glsl");
  //shd = loadShader("TexFrag1.glsl", "TexVert1.glsl");
  //shd = loadShader("LightFrag0.glsl", "LightVert0.glsl");
  //shd = loadShader("LightFrag1.glsl", "LightVert1.glsl");
  //shd = loadShader("TexLightFrag0.glsl", "TexLightVert0.glsl");
  //shd = loadShader("TexLightFrag1.glsl", "TexLightVert1.glsl");
}

void draw() {
  background(0);
  
  shader(shd);
  shd.set("u_time", float(millis())/float(1000));
  
  pointLight(255, 255, 255, width/2, height, 200);
  
  translate(width/2, height/2);
  rotateY(angle);
  shape(can);
  angle += 0.01;
}

PShape createCan(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(img);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);
  }
  sh.endShape();
  return sh;
}
