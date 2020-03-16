PImage img;

void setup(){
  size(600,400);
  
  img=loadImage("moon.jpg");
}

void draw(){
  image(img,0,0);
}
