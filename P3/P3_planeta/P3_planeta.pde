void setup()
{
  size(500,500,P3D);
  stroke(0);
}


void draw()
{
  background(200);
  
  //Esfera
  translate(width/2, height/2, 0);
  rotateX(radians(-45));
  sphere(100);
}
