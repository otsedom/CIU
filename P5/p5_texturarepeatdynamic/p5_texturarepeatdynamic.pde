PImage img;
PGraphics dytex;

void setup() {
  size(640, 360, P3D);
  img = loadImage("logoulpgc.png");
  
  dytex = createGraphics(img.width, img.height);
  dytex.beginDraw();
  dytex.image(img,0,0); // draw the image into the graphics object
  dytex.endDraw();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(dytex);  
  vertex(-100, -100, 0, 0, 0);
  vertex( 100, -100, 0, 2, 0);
  vertex( 100,  100, 0, 2, 2);
  vertex(-100,  100, 0, 0, 2);
  endShape();
  
  addRandomLine();
}

void addRandomLine(){
  dytex.beginDraw();
  dytex.stroke(255,255,0); // yellow
  dytex.strokeWeight(3); // need some weight to make sure it shows
  dytex.line(random(dytex.width), random(dytex.height),random(dytex.width), random(dytex.height));
  dytex.endDraw();
}
