PImage img;
PShape globo;
float ang;
  
void setup() {
  // Load an image
  size(600 , 600, P3D);
  img = loadImage("logoulpgc.png");
  
  
  beginShape();
  globo = createShape(SPHERE, 150);
  globo.setStroke(255);
  globo.scale(1.85, 1.09, 1.15);
  globo.setTexture(img);
  endShape(CLOSE);
  
  ang=0;
}

void draw() {
  background(0);
  
  //Iluminación al pulsar
  if (mousePressed) {
    pointLight(204, 153, 0, mouseX, mouseY, 400);
    directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  }
  
  
  translate(width / 2, height / 2);  
  rotateY(radians(ang));
  
  shape(globo);
  ang=ang+1;
  if (ang>360) ang=0;
}
