import processing.sound.*;

SinOsc osc;
Env env;

float tsubida = 0.001;
float tsostenido = 0.004;
float vsostenido = 0.5;
float tbajada = 0.4;

void setup() {
  size(640, 360);
  background(255);
  
  // Oscilador sinusoidal
  osc = new SinOsc(this);

  // Envolvente
  env  = new Env(this);  
}      

void draw() {
}

void mousePressed() {
  osc.play();
  env.play(osc, tsubida, tsostenido, vsostenido, tbajada);
}
