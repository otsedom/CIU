float ang;



void setup()
{
  size(500,500,P3D);
  stroke(0);
  
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
  sphere(100);
  
  //Resetea tras giro completo
  ang=ang+0.25;
  if (ang>360)
    ang=0;
    
  //Objeto orbitando geoestacionario
  translate(-width*0.25,0,0);
  box(10);
  
  
}
