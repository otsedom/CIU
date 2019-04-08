//Basado en Createting Procedural Artworks with Processing de Penny de Byl
void setup() {
  size(600,1000);
  background(255);
  fill(0);
  strokeWeight(2);
  textSize(20);
  
  int x,y,prex=0,prey=0;
  
  //no random
  for (x=0;x<width;x+=2){
    point(x,100);
  }
  text("nada", 10,50);
  
  //random
  for (x=0;x<width;x+=2){
    y=200+(int)random(100);
    point(x,y);
    
    if (x>0) line(prex,prey,x,y);
    
    prex=x;
    prey=y;
  }
  text("random", 10,200);
  
  //noise
  float noisex=0;
  int idx=2;
  for (int step=1;step<1000;step=step*10){
    noisex=0;
    for (x=0;x<width;x+=2){
      y=200*idx+(int)(noise(noisex)*100);
      point(x,y);
      
      if (x>0) line(prex,prey,x,y);
      
      prex=x;
      prey=y;
      
      noisex+=1.0/step;
    }
    String cad="perlin "+str(1.0/step);
    text(cad, 10,200*idx);
    idx++;
  }
}
  
  
