int mode;

void setup()
{
  size(800, 800, P3D);
  ortho();
  mode=0;  
}

void draw ()
{
  background(200);
  
  //Muestra modo proyección actual
  fill(0);
  if (mode == 1) {
    text("PERSPECTIVA", 20,20);
  } else {
    text("ORTOGRÁFICA", 20,20);
  }
  
  //Dibuja objeto en el centro de la ventana
  noFill();
  translate(width/2, height/2, 0);
  box(200);
}

void mouseClicked() {
  if (mode == 0) {
      mode=1;
      perspective();
      //saveFrame("perspectiva.png");
    } else {
      mode = 0;
      ortho();
      //saveFrame("ortografica.png");
    }
}
