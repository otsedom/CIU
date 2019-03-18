import ddf.minim.*;

Minim minim;

//Entrada
AudioInput IN;

void setup() {
  size(500, 200);
  background(255);
  
  minim = new Minim(this);
  
  // Línea estéreo de entrada, 44100 Hz 16 bits
  IN = minim.getLineIn(Minim.STEREO, 2048);
}

void draw() {
  background(0); 
  stroke(255);
  // Dibuja ondas
  // Valores entre -1 y 1, se escalan y desplazan
  for(int i = 0; i < IN.left.size()-1; i++)
  {
    line(i, height/2 + IN.left.get(i)*height/2, i+1, height/2 + IN.left.get(i+1)*height/2);
    line(i, 3*height/2 + IN.right.get(i)*height/2, i+1, 3*height/2 + IN.right.get(i+1)*height/2);
  }  
}

void stop()
{
  //Cerrar Minim antes de finalizar
  IN.close();
  minim.stop();  
  super.stop();
}
