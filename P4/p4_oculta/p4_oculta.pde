size(400, 400, P3D);
ortho(-width/2, width/2, -height/2, height/2);

hint(DISABLE_DEPTH_TEST);

fill(255);
translate(width/2, height/2, 0);
rotateX(-PI/6);
rotateY(PI/3);
box(100);
