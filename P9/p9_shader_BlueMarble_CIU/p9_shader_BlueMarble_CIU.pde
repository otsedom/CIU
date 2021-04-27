// Adapted from https://github.com/codeanticode/pshader-experiments/tree/master/BlueMarble

PShape earth;
PShape clouds;
PImage earthTex;
PImage cloudTex;
PImage alphaTex;
PImage bumpMap;
PImage specMap;
PShader earthShader,earthShader0,earthShader1,earthShader2;
PShader cloudShader,cloudShader0,cloudShader1;

float earthRotation;
float cloudsRotation;

void setup() {  
  size(1600, 1200, P3D);

  earthTex = loadImage("earthmap1k.jpg");
  cloudTex = loadImage("earthcloudmap.jpg");
  alphaTex = loadImage("earthcloudmaptrans.jpg");
  
  bumpMap = loadImage("earthbump1k.jpg");
  specMap = loadImage("earthspec1k.jpg");

  //Shader completo
  earthShader = loadShader("EarthFrag.glsl", "EarthVert.glsl");
  earthShader.set("texMap", earthTex);
  earthShader.set("bumpMap", bumpMap);
  earthShader.set("specularMap", specMap);
  earthShader.set("bumpScale", 0.05);
  //Con simplificaciones
  earthShader0 = loadShader("EarthFrag0.glsl", "EarthVert.glsl");
  earthShader0.set("texMap", earthTex);
  earthShader0.set("bumpMap", bumpMap);
  earthShader0.set("specularMap", specMap);
  earthShader0.set("bumpScale", 0.05);
  earthShader1 = loadShader("EarthFrag1.glsl", "EarthVert.glsl");
  earthShader1.set("texMap", earthTex);
  earthShader1.set("bumpMap", bumpMap);
  earthShader1.set("specularMap", specMap);
  earthShader1.set("bumpScale", 0.05);
  earthShader2 = loadShader("EarthFrag2.glsl", "EarthVert.glsl");
  earthShader2.set("texMap", earthTex);
  earthShader2.set("bumpMap", bumpMap);
  earthShader2.set("specularMap", specMap);
  earthShader2.set("bumpScale", 0.05);  
  
  //Shader completo
  cloudShader = loadShader("CloudFrag.glsl", "CloudVert.glsl");
  cloudShader.set("texMap", cloudTex);
  cloudShader.set("alphaMap", alphaTex);
  //Co simplificaciones
  cloudShader0 = loadShader("CloudFrag0.glsl", "CloudVert.glsl");
  cloudShader0.set("texMap", cloudTex);
  cloudShader0.set("alphaMap", alphaTex);
  cloudShader1 = loadShader("CloudFrag1.glsl", "CloudVert.glsl");
  cloudShader1.set("texMap", cloudTex);
  cloudShader1.set("alphaMap", alphaTex);
  
  earth = createShape(SPHERE, 140);
  earth.setStroke(false);
  earth.setSpecular(color(125));
  earth.setShininess(10);
  
  clouds = createShape(SPHERE, 141);
  clouds.setStroke(false);  
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  pointLight(255, 255, 255, 300, 0, 500);  
  
  float targetAngle = map(mouseX, 0, width, 0, TWO_PI);  
  earthRotation += 0.05 * (targetAngle - earthRotation);
  
  shader(earthShader0);
  pushMatrix();
  translate(-width/3, height/15);
  rotateY(earthRotation);
  shape(earth);
  popMatrix();
  
  shader(earthShader1);
  pushMatrix();
  translate(-width/8, height/15);
  rotateY(earthRotation);
  shape(earth);
  popMatrix();
  
  shader(earthShader2);
  pushMatrix();
  translate(width/8, height/15);
  rotateY(earthRotation);
  shape(earth);
  popMatrix();
  
  shader(earthShader);
  pushMatrix();
  translate(width/3, height/15);
  rotateY(earthRotation);
  shape(earth);
  popMatrix();
  
  //Clouds
  shader(cloudShader0);
  pushMatrix();
  translate(-width/4, -height/4);
  rotateY(earthRotation + cloudsRotation);
  shape(clouds);
  popMatrix();
  
  shader(cloudShader1);
  pushMatrix();
  translate(0, -height/4);
  rotateY(earthRotation + cloudsRotation);
  shape(clouds);
  popMatrix();
  
  shader(cloudShader);
  pushMatrix();
  translate(width/4, -height/4);
  rotateY(earthRotation + cloudsRotation);
  shape(clouds);
  popMatrix();
  
  
  //Completo
  shader(earthShader);
  pushMatrix();
  translate(0, height/3);
  rotateY(earthRotation);
  shape(earth);
  popMatrix();
  
  shader(cloudShader);
  pushMatrix();
  translate(0, height/3);
  rotateY(earthRotation + cloudsRotation);
  shape(clouds);
  popMatrix();

  cloudsRotation += 0.001;
}
