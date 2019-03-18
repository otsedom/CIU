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
}
