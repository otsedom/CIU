int modo=4;
int modomax=4;
int salto=40;


void setup(){
  size(550,550);
  dibujatrama();
}

void draw(){
    
}

void dibujatrama(){
  background(200);  
  for (int y=0;y<height;y++){
    for (int x=0;x<width;x++){
      dibuja(x,y);
    }
  }
}

void dibuja(int x,int y){
  float r;
  
  switch(modo){
    case 0: //franjas
    if (y%salto<salto/2)
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y); //<>//
    break;
    case 1: //franjas sinusoidales
    if ( (y+sin(x/8)*2)%salto<salto/2)
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y);
    break;
    case 2: //franjas
    if (y%50<25 || x%salto<salto/2)
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y);
    break;
    
    case 3: //anillos concéntricos
    //Distancia al centro de la ventana
    r=sqrt((x-width/2)*(x-width/2)+(y-height/2)*(y-height/2)) ;
    if ((int)r%salto<salto/2 )  
      stroke(255);
     else
      stroke(255,0,0);    
    point (x,y);
    break;   
  }
}

void mousePressed(){
  modo++;  
  if (modo>modomax) modo=0;
  println(modo);
  
  dibujatrama();
}
