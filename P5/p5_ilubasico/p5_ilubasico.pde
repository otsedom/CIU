float ang;

void setup()
{
  size(800, 800, P3D);
  ang=0;
}

void draw ()
{
  background(200);
  
  if (mousePressed) {
    lights();
  }
  
  //Dibuja objeto en el centro de la ventana
  translate(width/2, height/2, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  box(200);
  
  ang+=1;
  if (ang>360) ang=0;
}
