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
    lights();
    
    lightSpecular(100, 100, 100);
    directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  }
  
  //Dibuja objetos
  emissive(0,0,0);
  
  pushMatrix();
  translate(width*0.25, height*0.3, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(100, 100, 100);
  shininess(100);
  sphere(75);
  popMatrix();
  
   pushMatrix();
  translate(width*0.50, height*0.3, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(100, 100, 100);
  shininess(10);
  sphere(75);
  popMatrix();
  
   pushMatrix();
  translate(width*0.75, height*0.3, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(100, 100, 100);
  shininess(1);
  sphere(75);
  popMatrix();
  
  emissive(10,0,50);
  pushMatrix();
  translate(width*0.25, height*0.6, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  specular(0, 0, 100);
  shininess(10);
  sphere(75);
  popMatrix();
  
  emissive(50,0,50);
  pushMatrix();
  translate(width*0.5, height*0.6, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));  
  specular(0, 0, 100);
  shininess(10);
  sphere(75);
  popMatrix();
  
  emissive(0,50,0);
  pushMatrix();
  translate(width*0.75, height*0.6, 0);
  rotateX(radians(-30));
  rotateY(radians(ang));
  
  specular(0, 0, 50);
  shininess(10);
  sphere(75);
  popMatrix();
  
  
  
  ang+=1;
  if (ang>360) ang=0;
}
