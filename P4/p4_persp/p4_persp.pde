void setup()
{
  size(800, 800, P3D);
  perspective();  
}

void draw ()
{
  background(200);
  
  //Dibuja objeto en el centro de la ventana
  noFill();
  translate(width/2, height/2, 0);
  box(200);
}
