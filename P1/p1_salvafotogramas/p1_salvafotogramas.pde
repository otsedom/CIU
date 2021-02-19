void setup()
{
  size(400,400);
  stroke(0);
}

void draw()
{
  background(200);
  line(0,0,mouseX,mouseY);  
  
  saveFrame("fotograma-###.png");
}
