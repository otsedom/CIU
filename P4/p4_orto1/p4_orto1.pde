float ang;

void setup()
{
  size(400, 400, P3D);
  noFill();
  ang=0;
}

void draw ()
{
  background(200);
  ortho(-width/2, width/2, -height/2, height/2); 
  translate(width/2, height/2, 0);
  rotateY(radians(ang));
  box(100);
  
  ang+=0.5;
  if (ang==360) ang=0;
}
