float vx,vy,ang;

void setup()
{
  size(800, 800, P3D);  
  ang=0;
}

void draw ()
{
  background(200);
  //Vertical de partida (0,1,0)
  vx=-sin(radians(ang));
  vy=cos(radians(ang));
    
  //Configuración de la cámara
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, vx, vy, 0);
  
  noFill();
  translate(width/2, height/2, 0);
  box(200);
  
  ang=ang+0.25;
  if (ang>360) ang=ang-0;
}
