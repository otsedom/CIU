//Insipro en ejemplo puntillismo en Createting Procedural Artworks with Processing de Penny de Byl
import processing.video.*;

Capture cam;

void setup() {
  size(640 , 480, P3D);
  //Cámara
  cam = new Capture(this, width , height);
  cam.start(); 
  strokeWeight(random(20));  
}

void draw() {  
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
    
    loadPixels();
    //Recorre un número aleatorio de píxeles
    for (int i = 0; i < random(width*height); i++) {
      //coordenadas a ver
      int py=(int)random(height);
      int px=(int)random(width);      
      
      //color del píxel
      color pcol = cam.get(px,py);
      //asigna dicho color al pincel
      stroke(pcol);
      //grosor pincel
      if (mouseX>0)
        strokeWeight(random(5*width/mouseX));            
        
      //Dibuja
      point(px,py); //<>//
    }
    //Al no modificar, no necesitamos updatePixels
    //updatePixels();    
  }
  
}
