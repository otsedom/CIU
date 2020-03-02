int aspecto;
float cameraZ;

void setup()
{
  size(800, 800, P3D);
  //Valores por defecto de la perspectiva
  aspecto=width/height;  
  cameraZ= ((height/2.0) / tan(PI*60.0/360.0));
}

void draw ()
{
  background(200);
  
  perspective(mouseX/float(width) * PI/2, aspecto, cameraZ/10.0, cameraZ*10.0);
  
  //Dibuja objeto en el centro de la ventana
  noFill();
  translate(width/2, height/2, 0);
  box(200);
}

void mouseClicked() {
  //Modifica la relación de aspecto
  if (aspecto > width/height) {
      aspecto=width/height;
      
    } else {
      aspecto = 2*width/height;      
    }
}
