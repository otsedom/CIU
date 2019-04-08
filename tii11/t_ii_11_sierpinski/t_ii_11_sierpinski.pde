//Basado en Createting Procedural Artworks with Processing de Penny de Byl
PImage img;

int modo=0;

void setup(){
  size(500,500);
  background(255);
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  dibuja();
  
}

void draw(){
  
}

void mousePressed(){
  modo=1-modo;//alterna
  background(255);
  dibuja();
}

void keyPressed(){
  img=createImage(width,height,ARGB);
  loadPixels();
  //guarda pantalla en la imagen
  img.pixels=pixels;
  background(255);
  
  //Transformaciones Sierpinski, mitad de tamaño y desplazadas
  image(img,0,height/2,width/2,height/2);
  image(img,width/4,0,width/2,height/2);
  image(img,width/2,height/2,width/2,height/2);
}

void dibuja(){
  if (modo==0)
    triangle(width/2,0,width,height,0,height);
  else
    ellipse(width/2,height/2,width,height);
} 
 
