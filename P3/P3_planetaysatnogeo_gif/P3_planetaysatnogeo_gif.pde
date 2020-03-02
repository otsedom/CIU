import gifAnimation.*;

float ang;
float angS;
float speed=2;

GifMaker gifExport;

void setup()
{
  size(400,400,P3D);
  stroke(0);
  
  //Inicializa
  ang=0;
  
  //gif
  gifExport = new GifMaker(this, "export.gif");
    gifExport.setRepeat(0);        // make it an "endless" animation
  //gifExport.setTransparent(0,0,0);  // black is transparent
}


void draw()
{
  background(200);
  
  //Esfera
  translate(width/2, height/2, 0);
  rotateX(radians(-45));
  
  //Planeta
  pushMatrix();
  rotateY(radians(ang));
  sphere(100);
  popMatrix();
  
  //Resetea tras giro completo
  ang=ang+speed;
  if (ang>360)
    ang=0;
    
  //Objeto 
  pushMatrix();
  rotateZ(radians(angS));
  translate(-width*0.35,0,0);
  box(10);
  popMatrix();
  
   //Resetea tras giro completo
  angS=angS+speed;
  if (angS>360)
    angS=0;
    
  //gifExport.setDelay(0.1);
  gifExport.addFrame();
}

void mousePressed() {
    gifExport.finish();          // write file
}
