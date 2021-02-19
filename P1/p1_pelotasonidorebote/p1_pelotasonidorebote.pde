import processing.sound.*;

SoundFile  sonido;

int cx,cy,rad;
int incx;

void setup(){
  size(500,500);
  rad=30;
  cx =width/2;
  cy=height/2;
  incx=round(random(5));
  
}

void draw(){
  background(128);
  circle(cx,cy,rad);
  
  cx=cx+incx;
  if (cx+rad/2>width || cx-(rad/2)<0){
    incx=-incx;
  }
}
