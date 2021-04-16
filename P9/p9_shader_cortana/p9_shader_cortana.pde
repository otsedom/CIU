//Basado en la práctica entregada por Borja Zarcon curso 19/20
import processing.sound.*;

AudioIn IN;
Amplitude level;

PShader sh;

void setup() {
  size(600, 600, P2D);
  noStroke();
  IN = new AudioIn(this, 0);

  IN.start();
  level = new Amplitude(this);
  level.input(IN);
  sh = loadShader("anillos.glsl");
}


void draw() {
  float volume = level.analyze() + 0.1;
  
  sh.set("u_resolution", float(width), float(height));
  sh.set("u_volume", volume);
  shader(sh);
  rect(0,0,width,height);  
}
