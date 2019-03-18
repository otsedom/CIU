import processing.sound.*;

SinOsc[] ondas;

int nondas=1;
int maxondas=5;

void setup() {
  size(500, 100);
  background(255);
    
  // Crea los osciladores 
  ondas = new SinOsc[maxondas];
  
  for (int i = 0; i < maxondas; i++) 
  {
    // Osciladores sinusoidales
    ondas[i] = new SinOsc(this);
    //Inicialmante lanza únicamente el primero
    if (i==0) 
    {
      ondas[i].play();
      //frecuencia y volumen deel primero
      ondas[i].freq(20);
      ondas[i].amp(0.5);
    }    
  } 
  //Muestra el número de osciladores 
  println(nondas);
}

void draw() {
  background(255);
  
  //Frecuencia de la menor, relacionada con la posición del ratón
  float freq0 = map(mouseX, 0, width, 20.0, 500.0);
  
  for (int i = 0; i < nondas; i++) 
  {
    //Frecuencia doble que la previa
    ondas[i].freq(freq0 * pow(2,i));
    //Volumen total no debe superar 1.0
    //A mayor frecuencia, asociamos menor volumen, mitad que frecuencia anterior
    ondas[i].amp((1.0 / pow(2,i+1)));
  } 
}

//Añade o elimina osciladores
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN)
    {    
      if (keyCode == UP) {
        //Actualiza el número de osciladores
        nondas=nondas+1;
        //Controla no salirse de los límites
        if (nondas>maxondas)
          nondas=maxondas;
        else // si no se ha salido lanza la siguiente frecuencia más alta
          ondas[nondas-1].play();
          
       
      } else {
        //Detiene la más alta activa
        if (nondas>0) ondas[nondas-1].stop();
        //Actualiza el número de osciladores
        nondas=nondas-1;
        //Controla no salirse de los límites
        if (nondas<1) 
          nondas=0; 
      }
      //Muestra el número de osciladores 
      println(nondas);     
    }
  } 
}
