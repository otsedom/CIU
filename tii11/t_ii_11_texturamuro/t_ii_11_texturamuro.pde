int modo=0;
int modomax=3;

void setup(){
  size(600,600);
  background(128);
  stroke(255);
}

void draw(){
    int saltox,saltoy;
    
    background(128);
    
    if (mouseX>0 && mouseX<width)
      saltox=10+(int)(mouseX%width);
    else
      saltox=10;
    if (mouseY>0 && mouseY<height)
      saltoy=10+(int)(mouseY%height);
    else
      saltoy=10;
    
    for (int x=0;x<height;x+=saltox){
      for (int y=0;y<width;y+=saltoy){
        rect(x,y,saltox*0.9,saltoy*0.9); 
      }
    }
}
