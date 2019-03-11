import processing.video.*;

Capture cam;

void setup() {
  size(640 , 480, P3D);
  //Cámara
  cam = new Capture(this, width , height);
  cam.start(); 
}

void draw() {  
  if (cam.available()) {
    background(0);
    cam.read();
    
    //comportamiento diferenciado si hay clic
    if (mousePressed)
      //Desplaza la imagen de forma aleatoria al mostrarla
      image(cam,random(-5,5),random(-5,5));
     else
      image(cam,0,0);
  }
}
