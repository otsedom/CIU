import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

Minim minim;

//Entrada
AudioInput IN;
//Grabación
AudioRecorder recorder;
boolean recorded;
//Reproducción
AudioOutput OUT;
FilePlayer player;

//Filtros
LowPassSP   lpf;
HighPassSP hpf;

int tipofiltro=1;
int maxfiltros=2;

void setup() {
  size(500, 200);
  background(255);
  
  minim = new Minim(this);
  
  // Línea estéreo de entrada, 44100 Hz 16 bits
  IN = minim.getLineIn(Minim.STEREO, 2048);
  
  // Define el nombre del archivo a salvar
  recorder = minim.createRecorder(IN, "sonido.wav");
  
  // Canal de salida para la reproducción
  OUT = minim.getLineOut( Minim.STEREO );
}

void draw() {
  background(0); 
  stroke(255);
  // Dibuja ondas
  // Valores entre -1 y 1, se escalan y desplazan
  if (!recorded)
  {
    for(int i = 0; i < IN.left.size()-1; i++)
    {
      line(i, height/2 + IN.left.get(i)*height/2, i+1, height/2 + IN.left.get(i+1)*height/2);
      line(i, 3*height/2 + IN.right.get(i)*height/2, i+1, 3*height/2 + IN.right.get(i+1)*height/2);
    }
  }
  else
  {
    for(int i = 0; i < OUT.left.size()-1; i++)
    {
      line(i, height/2 + OUT.left.get(i)*height/2, i+1, height/2 + OUT.left.get(i+1)*height/2);
      line(i, 3*height/2 + OUT.right.get(i)*height/2, i+1, 3*height/2 + OUT.right.get(i+1)*height/2);
    }
  }
  
  if ( recorder.isRecording() )
  {
    text("Grabando,`pulsar r para detener", 5, 15);
  }
  else 
  {
    if ( !recorded )
    {
      text("Pulsar r para grabar", 5, 15);
    } 
     else
    {
      text("Mueve el ratón para filtrar, cursor para cambiar de filtro", 5, 15);
    }
  }  
}

void keyReleased()
{
  if ( key == 'r' && !recorded ) 
  {
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
      recorded=true;
      //Salva y reproduce
      recorder.save();
      if ( player != null )
      {
          player.unpatch( OUT );
          player.close();
      }
      player = new FilePlayer( recorder.save() );
      
      //Creación de filtros
      lpf = new LowPassSP(100, player.sampleRate());
      hpf = new HighPassSP(1000, player.sampleRate());
      
      //Asocia filtro por defecto
      player.patch(lpf).patch( OUT );
      
      //En bucle
      player.loop();
     }
    else
    {
      recorder.beginRecord();
    }
  }
  
  //Escoge filtro a aplicar
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN)
    {    
      switch (tipofiltro)
        {
          case 1:
            player.unpatch(lpf);
            break;
            case 2:
            player.unpatch(hpf);
            break;
            default:
            break;            
        }
        
      if (keyCode == UP) {       
        
        //Actualiza el filtro
        tipofiltro=tipofiltro+1;
        //Controla no salirse de los límites
        if (tipofiltro>maxfiltros)
          tipofiltro=1;
        
      } else {
        //Actualiza el número de osciladores
        tipofiltro=tipofiltro-1;
        //Controla no salirse de los límites
        if (tipofiltro<1) 
          tipofiltro=maxfiltros; 
      }
      
      switch (tipofiltro)
        {
          case 1:
            player.patch(lpf).patch(OUT);
            break;
            case 2:
            player.patch(hpf).patch(OUT);
            break;
            default:
            break;            
        }
      //Muestra el tipo de filtro
      println(tipofiltro);     
    }
  } 
}

void mouseMoved()
{
  if (recorded)
  {
  float cutoff; 
  
  // Mapea puntero a rango de frecuencias en base a cada filtro  
  switch (tipofiltro){
    case 1:
      cutoff = map(mouseX, 0, width, 60, 2000);
      lpf.setFreq(cutoff);
    break;
    case 2:
      cutoff = map(mouseX, 0, width, 1000, 14000);
      hpf.setFreq(cutoff);
    default:
    
    break;
  
  }
  }
}


void stop()
{
  //Cerrar Minim antes de finalizar
   IN.close();
  if ( player != null )
  {
    player.close();
  }
  minim.stop();
  
  super.stop();
}
