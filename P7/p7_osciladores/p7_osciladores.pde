import processing.sound.*;
Pulse pulso;
SinOsc sinu;
SawOsc sier;
SqrOsc cuad;
TriOsc tria;


int tipo=1;

void setup() {
  size(600, 400);
  background(255);
    
  // Crea los osciladores 
  pulso = new Pulse(this);
  sinu = new SinOsc(this);
  sier = new SawOsc(this);
  cuad = new SqrOsc(this);
  tria = new TriOsc(this);
  
  //Inicialmente comienza con la de tipo pulso
  //Lanza el oscilador 
  pulso.play();  
}

void draw() {
  background(255);
  
  switch (tipo)
  {
    case 1:
      //Ajusta el volumen en función de la posición y del puntero
      pulso.amp(map(mouseY,0,height,0,1));
      //Ajusta la frecuencia en función de la posición x del puntero
      pulso.freq(map(mouseX, 0, width, 20.0, 500.0));
      break;
    case 2:
      //Ajusta el volumen en función de la posición y del puntero
      sinu.amp(map(mouseY,0,height,0,1));
      //Ajusta la frecuencia en función de la posición x del puntero
      sinu.freq(map(mouseX, 0, width, 20.0, 500.0));
      break;
    case 3:
      //Ajusta el volumen en función de la posición y del puntero
      sier.amp(map(mouseY,0,height,0,1));
      //Ajusta la frecuencia en función de la posición x del puntero
      sier.freq(map(mouseX, 0, width, 20.0, 500.0));
      break;
    case 4:
      //Ajusta el volumen en función de la posición y del puntero
      cuad.amp(map(mouseY,0,height,0,1));
      //Ajusta la frecuencia en función de la posición x del puntero
      cuad.freq(map(mouseX, 0, width, 20.0, 500.0));
      break;
    case 5:
      //Ajusta el volumen en función de la posición y del puntero
      tria.amp(map(mouseY,0,height,0,1));
      //Ajusta la frecuencia en función de la posición x del puntero
      tria.freq(map(mouseX, 0, width, 20.0, 500.0));
      break;
    default:
    break;
  }
  //
  ellipse(mouseX,mouseY,map(mouseX, 0, width, 1.0, 50.0), map(mouseY,0,height,0,50));
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN)
    {
      //Detiene oscilador anteriormente activo
      switch (tipo)
      {
        case 1:
         pulso.stop();
          break;
        case 2:
         sinu.stop();
          break;
        case 3:
         sier.stop();
          break;
        case 4:
         cuad.stop();
          break;
        case 5:
         tria.stop();
          break;
        default:
        break; 
      }
      
    
      if (keyCode == UP) {
        tipo=tipo+1;
        if (tipo>5) tipo=1;
       
      } else {
        tipo=tipo-1;
        if (tipo<1) tipo=5;
      }
     
      
       //Lanza nuevo oscilador
      switch (tipo)
      {
        case 1:
          pulso.play();
          println("PULSO");
          break;
        case 2:
          sinu.play();
          println("SINUSOIDAL");
          break;
        case 3:
          sier.play();
          println("SIERRA");
          break;
        case 4:
          cuad.play();
          println("CUADRADA");
          break;
        case 5:
          tria.play();
          println("TRIANGULAR");
          break;
        default:
        break; 
      }
    }
  } 
}
