void setup()
{
  size(800, 800, P3D); 
  camera();
}

void draw ()
{
  background(200);
  
  noFill();
  translate(width/2, height/2, 0);
  box(200);
}
