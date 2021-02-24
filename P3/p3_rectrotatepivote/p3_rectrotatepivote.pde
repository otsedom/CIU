void setup()
{
  size(200, 200);
  background(255);
  smooth();
  fill(192);
  noStroke();
  rect(40, 40, 40, 40);
  
  pushMatrix();
  // mueve el origen al punto pivote
  translate(40, 40); 
  
  // rota sobre ese punto pivote
  rotate(radians(45));
  
  // y dibuja el cuadrado
  fill(0);
  rect(0, 0, 40, 40);
  popMatrix(); //luego reestablece los ejes
}
