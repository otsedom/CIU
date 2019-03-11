import processing.video.*;

Capture cam;
int dimension;

void setup(){
  size(640, 480);
  //Cámara
  cam = new Capture(this, width , height);
  cam.start();  
  //Obtiene el tamaño de la imagen
  dimension = cam.width * cam.height;
}

void draw(){
  if (cam.available())
  { 
    background(0);
    cam.read() ; 
    
    //Carga píixeles para poder operar con ellos
    cam.loadPixels();
    //Recorre la parte superior de la imageen
    for (int i=1;i<dimension/2;i++)
    {
        //Suma las tres componenntes del píxel
        float  suma=red(cam.pixels[i])+green(cam.pixels[i])+blue(cam.pixels[i]);
        
        //Umbraliza, asigna blanco o negro, en base a comparar el valor intermedio
        if (suma<255*1.5)
        {
          cam.pixels[i]=color(0, 0, 0);
        }        
        else
        {
          cam.pixels[i]=color(255, 255, 255);
        }
    }
    //Actualiza pixeles
    cam.updatePixels();
  } 
  //Muestra la imagen
  image( cam ,0 ,0) ; 
}
