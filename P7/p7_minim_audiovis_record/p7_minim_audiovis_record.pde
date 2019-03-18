//Basado en ejemplo de Minim Basics->RecordAudioInput
import ddf.minim.*;
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
  for(int i = 0; i < IN.left.size()-1; i++)
  {
    line(i, height/2 + IN.left.get(i)*height/2, i+1, height/2 + IN.left.get(i+1)*height/2);
    line(i, 3*height/2 + IN.right.get(i)*height/2, i+1, 3*height/2 + IN.right.get(i+1)*height/2);
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
      player.patch( OUT );
      player.play();
     }
    else
    {
      recorder.beginRecord();
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
