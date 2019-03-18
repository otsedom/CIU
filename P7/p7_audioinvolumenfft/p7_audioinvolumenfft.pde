import processing.sound.*;

AudioIn IN;
Amplitude nivel;
FFT fft;
int bandas=512;
float[] spectrum = new float[bandas];

void setup() {
  size(500, 200);
  background(255);
  
  // Entrada de audio, toma primer canal
  IN = new AudioIn(this, 0);
  
  //Lanza captura
  IN.start();
  
  // Analizador de amplitud
  nivel = new Amplitude(this);
  
  //Analizador frecuencias
  fft = new FFT(this, bandas);

  // Asocia entrada y analizadores
  nivel.input(IN);
  fft.input(IN);

  //Tono de relleno con transparencia
  fill(255,0,0,50);
}

void draw() {
  background(255);
  
  //Obtiene valor entre 0 y 1 en base al nivel
  float volumen = nivel.analyze();
  
  //Asocia ancho de rectángulo al nivel del volumen
  int ancho = int(map(volumen, 0, 1, 1, 500));
  rect(0,0,ancho,100);  
  
  pushStyle();
  noStroke();
  rect(0,0,ancho,height/2);
  popStyle();
  
  //FFT
  fft.analyze(spectrum);

  for(int i = 0; i < bandas; i++){
  // Resultado de FFT normalizado
  // Línea por banda de frecuencia, considerando amplitud hasta 5
  line( i, height, i, height - spectrum[i]*height/2*5 );
  } 
}
