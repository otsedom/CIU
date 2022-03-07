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
    float val=(float)mouseX/(float)width*(float)255;
    ambientLight((int)val,0,0);
    directionalLight(50, 200, 50, -1, 0, 0);
    pointLight(noise(float(frameCount)/6.0) * 255, noise(float(frameCount)/2.0) * 255, noise(float(frameCount)/3.0) * 255, mouseX, mouseY, 400);
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
