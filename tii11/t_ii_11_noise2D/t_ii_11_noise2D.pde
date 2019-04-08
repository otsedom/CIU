//Basado en Createting Procedural Artworks with Processing de Penny de Byl
float stepsize=1;

void setup() {
  size(600,600);
  fill(0);
  textSize(20);
  frameRate(6);
}

void draw(){
  
  float xnoise=0;
  
  
  for (int x=0;x<width;x++){
    float ynoise=0;
    for (int y=0;y<width;y++){
      stroke(noise(xnoise,ynoise)*255);
      point(x,y);
      ynoise+=stepsize;
    }
    xnoise+=stepsize;
  }
  String cad="perlin "+str(stepsize);
    text(cad, 10,20);
}

void mousePressed(){
  stepsize=(float)mouseX/(float)width;
}
  
  
