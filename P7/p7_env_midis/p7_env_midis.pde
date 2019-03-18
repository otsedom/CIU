import processing.sound.*;

SinOsc osc;
Env env;

// Notas MIDI
int[] midiSequence = { 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72 }; 

//Envolvente
float tsubida = 0.001;
float tsostenido = 0.004;
float vsostenido = 0.5;
float tbajada = 0.4;

void setup() {
  size(650, 100);
  background(255);
  
  // Oscilador sinusoidal
  osc = new SinOsc(this);

  // Envolvente
  env  = new Env(this); 
  
  noStroke();
  fill(0);
}      

void draw() {
  //Dibujamos las celdas/teclas
  for (int i=0;i<6;i++){
    rect(i*100+50,0,50,100);
  }  
}

void mousePressed() {
  //Nota en función del valore de mouseX
  int tecla=(int)(mouseX/50);
  println(tecla);
  
  osc.play(midiToFreq(midiSequence[tecla]), 0.5);
  env.play(osc, tsubida, tsostenido, vsostenido, tbajada);  
}

// Conversor de nota MIDI A frecuencia, del ejemplo Envelopes de la biblioteca Sound
float midiToFreq(int nota) {
  return (pow(2, ((nota-69)/12.0))) * 440;
}
