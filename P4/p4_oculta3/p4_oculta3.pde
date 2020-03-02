size(400, 400, P3D);
ortho(-width/2, width/2, -height/2, height/2); 

pushMatrix();
fill(255);
translate(width/2, height/2, 0);
rotateX(-PI/6);
rotateY(PI/3);
box(100);
popMatrix();

pushMatrix();
fill(128);
translate(width/2-15, height/2-20, 55);
rotateX(-PI/6);
rotateY(PI/3);
box(50);
popMatrix();

//saveFrame("p4_oculta2.png");
