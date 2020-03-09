void setup()
{
  size(800, 800, P3D);
  fill(204);
  sphereDetail(60);
}

void draw ()
{
  background(128);
  
  translate(width/2, height/2, 0);
  sphere(150); 
}
