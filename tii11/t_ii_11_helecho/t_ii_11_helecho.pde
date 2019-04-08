//Basado en Createting Procedural Artworks with Processing de Penny de Byl
PGraphics pg;

void setup(){
  size(1000,1000,P2D);
  background(255);
  //Búfer gráfico
  pg=createGraphics(width,height);
  pg.beginDraw();
  pg.rectMode(CENTER);
  pg.stroke(0);
  pg.strokeWeight(10);
  pg.fill(0);
  pg.background(255,0);
  pg.translate(width/2,height/2);
  pg.rect(0,0,400,800);
  pg.endDraw();
  image(pg,0,0);
}

void draw(){
  
}

void keyPressed(){
  if (key=='r') background(255);
  PGraphics npg;
  
  npg=createGraphics(width,height);
  npg.beginDraw();
  npg.imageMode(CENTER);
  npg.background(255,0);
  npg.translate(width/2,height/2);
  
  //1
  npg.pushMatrix();
  npg.translate(15,-80);
  npg.rotate(radians(2.5));
  npg.translate(0,16);
  npg.scale(0.85,0.85);
  npg.image(pg,0,0);
  npg.popMatrix();
  
  //2
  npg.pushMatrix();
  npg.translate(120,250);
  npg.rotate(radians(49));
  npg.translate(0,16);
  npg.scale(0.34,0.34);
  npg.image(pg,0,0);
  npg.popMatrix();
  
  //3
  npg.pushMatrix();
  npg.translate(-120,185);
  npg.rotate(radians(-50));
  npg.translate(0,4.4);
  npg.scale(0.3,0.37);
  npg.image(pg,0,0);
  npg.popMatrix();
  
   //4
  npg.pushMatrix();
  npg.translate(0,340);
  npg.scale(0.01,0.16);
  npg.image(pg,0,0);
  npg.popMatrix();
  
  npg.endDraw();
  background(255);
  image(npg,0,0);
  pg=npg;
  
  
  
  
  
}
