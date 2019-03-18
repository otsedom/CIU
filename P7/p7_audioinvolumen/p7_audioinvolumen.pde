import processing.sound.*;

AudioIn IN;
Amplitude nivel;

void setup() {
  size(500, 100);
  background(255);
  
  // Entrada de audio, toma primer canal
  IN = new AudioIn(this, 0);
  
  //Lanza captura
  IN.start();
  
  // Analizador de amplitud
  nivel = new Amplitude(this);

  // Asocia entrada y analizador
  nivel.input(IN);
  
  noStroke();
  //Tono de relleno con transparencia
  fill(255,0,0,50);
}

void draw() {
  background(255);
  
  //Obtiene valor entre 0 y 1 en base al nivel
  float volumen = nivel.analyze();
  
  //Asocia ancho de rectángulo al nivel del volumen
  int ancho = int(map(volumen, 0, 1, 1, 500));
  rect(0,0,ancho,100);  
}
