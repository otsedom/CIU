PImage [] img=new PImage [6];
int frame=0;

void setup(){
  size(600,400);
  
  img[0]=loadImage("Ciclo1.png");
  img[1]=loadImage("Ciclo2.png");
  img[2]=loadImage("Ciclo3.png");
  img[3]=loadImage("Ciclo4.png");
  img[4]=loadImage("Ciclo5.png");
  img[5]=loadImage("Ciclo6.png");
  
  frameRate(6);
}

void draw(){
  background(128);
  image(img[frame],0,0);
  
  frame=frame+1;
  if (frame==6){
    frame=0;
  }
}
