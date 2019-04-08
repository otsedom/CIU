//Basado en Createting Procedural Artworks with Processing de Penny de Byl
float x=0;
float y=0;
float x1,y1;


void setup(){
  size(500,500);
  background(255);
  stroke(0);
  //Punto de partida
  x=0;
  y=0;
}

void draw(){
  for (int i=1;i<100;i++)
    dibuja();
}

void dibuja(){ //<>//
  float r=random(1);
  
  //Transformación en base al valor de r
  if (r<0.33) {
    x1=0.5*x;
    y1=0.5*y;
  }
  else
  {
    if (r<0.66) {
      x1=0.5*x+0.25;
      y1=0.5*y+0.5;
    }
    else// entre 0.66 y 1
    {
      x1=0.5*x+0.5;
      y1=0.5*y;
    }
  }
  pushMatrix();
  //Traslado al centro
  translate(0,height);
  //translate(50,height-50);
  strokeWeight(1.0/(float)width*2);
  scale(width,-height);
  //Dibuja y almacena
  point(x1,y1);
  popMatrix();
  x=x1;
  y=y1;
}
