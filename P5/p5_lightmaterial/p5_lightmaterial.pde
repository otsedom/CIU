float ang;
int modo;

void setup()
{
  size(800, 800, P3D);
  ang=0;
  noStroke();
  sphereDetail(60);
  modo = 0;
}

void draw ()
{
  background(200);
  
  pushStyle();
  switch (modo) {
    case 0:
    Modo0();
    break;
    case 1: 
    Modo1();
    break;
    case 2: 
    Modo2();
    break;
    case 3: 
    Modo3();
    break;  
  }
  popStyle();
 
  ang+=1;
  if (ang>360) ang=0;
}

void Modo0(){
  text("POR DEFECTO", 10,20);
  lights();
  
  pushMatrix();
  translate(width*0.25, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.50, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.75, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  sphere(75);
  popMatrix();
}

void Modo1(){
  text("AMBIENT", 10,20);
  
  ambientLight(128, 128, 128); 
  directionalLight(128,128,128, 0, 1, -1);
  
  pushMatrix();
  translate(width*0.25, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  ambient(255, 255, 255);
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.50, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  ambient(255, 255,0);//Capa el azul del reflejo ambniente
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.75, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  ambient(255, 0,0);//Capa verde y azul del reflejo ambniente
  sphere(75);
  popMatrix();
}

void Modo2(){
  text("SPECULAR & SHININESS", 10,20);
  
  ambientLight(128, 128, 128);
  lightSpecular(128,128,128);  
  directionalLight(128,128,128, 0, 1, -1);
    
  pointLight(0, 0, 10,mouseX,mouseY,1000);
  
  pushMatrix();
  translate(width*0.25, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(255,255,255);
  shininess(1.0 + (100 * abs(cos(frameCount * 0.1))));
  ambient(255,255,155);
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.50, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(255,255,255);
  shininess(1.0 + (100 * abs(cos(frameCount * 0.1))));
  ambient(255, 255,0);
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.75, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(255,255,255);
  shininess(1.0 + (100 * abs(cos(frameCount * 0.1))));
  ambient(255, 0,0);
  sphere(75);
  popMatrix();
}

void Modo3(){
  text("EMISSIVE", 10,20);
  
  ambientLight(128, 128, 128);
  lightSpecular(128,128,128);
  directionalLight(128,128,128, 0, 1, -1);
    
  pointLight(0, 0, 10,mouseX,mouseY,1000);
  
  pushMatrix();
  translate(width*0.25, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(255,0,0);
  emissive(50,50,50);
  shininess(1.0 + (100 * abs(cos(frameCount * 0.1))));
  ambient(255, 255,0);
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.5, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  emissive(0,50,50);
  specular(255,255,255);
  shininess(1.0 + (100 * abs(cos(frameCount * 0.1))));
  ambient(255, 255,0);
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width*0.75, height*0.5, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  emissive(0,0,50);
  specular(255,255,255);
  shininess(1.0 + (100 * abs(cos(frameCount * 0.1))));
  ambient(255, 255,0);
  sphere(75);
  popMatrix();
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      modo += 1;
      if (modo > 3) {
          modo=0;      
      }  
    } 
    else if (keyCode == DOWN) {
      modo -= 1;
      if (modo < 0) {
          modo=3;      
      }  
    } 
  }
}

void mouseClicked() {
  modo += 1;
  if (modo > 3) {
          modo=0;      
   }  
}
