float ang;
float angS;

int nframes = 0;

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
  
  //Planeta
  pushMatrix();
  rotateY(radians(ang));
  sphere(100);
  popMatrix();
  
  //Resetea tras giro completo
  ang=ang+0.25;
  if (ang>360)
    ang=0;
    
  //Objeto 
  pushMatrix();
  rotateZ(radians(angS));
  translate(-width*0.25,0,0);
  box(10);
  popMatrix();
  
   //Resetea tras giro completo
  angS=angS+0.25;
  if (angS>360)
    angS=0;
    
  //  if (nframes <900 && nframes%150 ==0){
  // saveFrame("p3satnogeo_fotograma-###.png");
  //}
   
  // nframes+=1;
}
