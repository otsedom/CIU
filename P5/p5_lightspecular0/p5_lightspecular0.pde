float ang;

void setup()
{
  size(800, 800, P3D);
  ang=0;
  noStroke();
  sphereDetail(60);
}

void draw ()
{
  background(200);
  
  if (mousePressed) {
    pointLight(204, 153, 0, mouseX, mouseY, 400);
    lightSpecular(100, 100, 100);
    directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
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
