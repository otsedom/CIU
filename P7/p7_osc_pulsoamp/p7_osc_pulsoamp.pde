//Carga biblioteca
import processing.sound.*;

Pulse pulso;

void setup() {
  size(600, 400);
  background(255);
    
  // Crea un oscilador de tipo pulso
  pulso = new Pulse(this);
    
  //Lanza el oscilador 
  pulso.play();
}

void draw() {
   //Ajusta amplitud en función de la posición y del puntero
  pulso.amp(map(mouseY,0,height,0,1));
}
