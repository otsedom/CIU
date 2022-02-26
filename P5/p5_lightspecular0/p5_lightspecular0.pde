float ang;
float modo;

void setup()
{
  size(800, 800, P3D);
  ang=0;
  noStroke();
  sphereDetail(60);
  modo=1;
}

void draw ()
{
  background(200);
  
  if (mousePressed) {
    pointLight(255,255, 255, mouseX, mouseY, 400);
    if (modo == 1) { 
      text("ESPECULAR", 20,20);
      lightSpecular(0, 0, 255); 
    }
  }
  else
  {
    lights();
  }
  
  //Dibuja objetos 
  pushMatrix();
  translate(width/4, height/2, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  sphere(75);
  popMatrix();
  
  pushMatrix();
  translate(3*width/4, height/2, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  sphere(75);
  popMatrix();
  
  ang+=1;
  if (ang>360) ang=0;
}

void keyPressed() {
  if (modo == 0) {
    modo = 1;
  } else {
    modo = 0;
  }
}
