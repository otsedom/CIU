PImage img;
PGraphics mitex;

void setup() {
  size(640, 360, P3D);
  img = loadImage("logoulpgc.png");
  
  mitex = createGraphics(img.width, img.height);
  mitex.beginDraw();
  mitex.image(img,0,0); // draw the image into the graphics object
  mitex.endDraw();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  textureMode(NORMAL);
  textureWrap(REPEAT); 
  beginShape();
  texture(mitex);  
  vertex(-100, -100, 0, 0, 0);
  vertex( 100, -100, 0, 2, 0);
  vertex( 100,  100, 0, 2, 2);
  vertex(-100,  100, 0, 0, 2);
  endShape();
  
  addRandomLine();
}

void addRandomLine(){
  mitex.beginDraw();
  mitex.stroke(255+random(-5,5),255+random(-5,5),0); // color líneas
  mitex.strokeWeight(3); // grosor
  mitex.line(random(mitex.width), random(mitex.height),random(mitex.width), random(mitex.height));
  mitex.endDraw();
}
