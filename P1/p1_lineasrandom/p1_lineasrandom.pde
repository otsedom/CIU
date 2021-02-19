void setup(){
  size(500,500);
  frameRate(5);
}

void draw(){
  if (random(100)>50){
    background(128);
  }
  stroke(random(255),random(255),random(255));
  line(mouseX,mouseY,random(width),random(height)); 
}
