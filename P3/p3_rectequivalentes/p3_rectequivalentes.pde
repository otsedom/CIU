void setup()
{
  size(200, 200);
  background(255);
  noStroke();
  // Dibuja el primer objeto 
  fill(192);
  rect(20, 20, 40, 40);
  // Dibuja otro desplazado
  fill(255, 0, 0, 128);
  rect(20 + 60, 20 + 80, 40, 40);
  
  // El nuevo recuadro usa las mismas coordenadas que el primero pero antes se mueve el sistema de referencia
  fill(0, 0, 255, 128);
  pushMatrix(); //Salva el sistema de coordenadas actual
  translate(60, 80);
  rect(20, 20, 40, 40);
  popMatrix(); //vuelve al sistema de coordenadas original
}
