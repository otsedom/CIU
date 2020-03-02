int px,py;

void setup()
{
  size(800, 800, P3D);  
  px=0;
  py=0;
}

void draw ()
{
  background(200);
  
  //Configuración de la cámara
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0-px, height/2.0-py, 0, 0, 1, 0);
  
  noFill();
  translate(width/2, height/2, 0);
  box(200);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      py+=10;
    } 
    else
    {
      if (keyCode == DOWN) {
        py-=10;
      }
      else
      {
        if (keyCode == LEFT) {
          px-=10;
        } 
        else
        {
          if (keyCode == RIGHT) {
            px+=10;
          } 
        }
      }
    }
  } 
}

//void mouseClicked() {
//  saveFrame("p4_cammodipto0.png");
//}
