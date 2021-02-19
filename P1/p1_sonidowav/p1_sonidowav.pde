import processing.sound.*;

int pos=0;
int mov=5;

SoundFile  sonido;

void setup(){
  size(400,400);
  
  sonido = new SoundFile(this,"Alesis-Fusion-Bass-C3.wav");
}   
   
void draw(){
  background(128);
  ellipse(pos,30,30,30);
  
  pos=pos+mov;
  
  if (pos>=400 || pos<=0){
    mov=-mov;
    sonido.play ( ) ; 
  }
}
