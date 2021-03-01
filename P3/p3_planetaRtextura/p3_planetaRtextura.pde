float ang;
PShape planeta;
PImage img;

void setup()
{
  size(500,500,P3D);
  stroke(0);
  img = loadImage("tierra.jpg");
  
  beginShape();
  planeta = createShape(SPHERE, 100);
  planeta.setStroke(255); //Elimina visualización de aristas
  planeta.setTexture(img);
  endShape(CLOSE);
  
  //Inicializa
  ang=0;
}


void draw()
{
  background(200);
  
  //Esfera
  translate(width/2, height/2, 0);
  rotateX(radians(-45));
  rotateY(radians(ang));
  shape(planeta);
  
  //Resetea tras giro completo
  ang=ang+0.25;
  if (ang>=360)
    ang=0;
}
