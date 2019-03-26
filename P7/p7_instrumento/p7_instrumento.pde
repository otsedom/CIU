/**
  * This sketch demonstrates how to create synthesized sound with Minim using an AudioOutput and
  * an Instrument we define. By using the playNote method you can schedule notes to played 
  * at some point in the future, essentially allowing to you create musical scores with code. 
  * Because they are constructed with code, they can be either deterministic or different every time. 
  * This sketch creates a deterministic score, meaning it is the same every time you run the sketch.
  * <p>
  * For more complex examples of using playNote check out algorithmicCompExample and compositionExample
  * in the Synthesis folder.
  * <p>
  * For more information about Minim and additional features, visit http://code.compartmental.net/minim/
  */

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

String [] notas={"A3", "B3", "C4", "D4", "E4", "F4", "G4", "A4", "B4", "C5", "D5", "E5", "F5"};
// Tecla
int tecla; 

// to make an Instrument we must define a class
// that implements the Instrument interface.
class SineInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;
  
  SineInstrument( float frequency )
  {
    // make a sine wave oscillator
    // the amplitude is zero because 
    // we are going to patch a Line to it anyway
    wave   = new Oscil( frequency, 0, Waves.SINE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }
  
  // this is called by the sequencer when this instrument
  // should start making sound. the duration is expressed in seconds.
  void noteOn( float duration )
  {
    // start the amplitude envelope
    ampEnv.activate( duration, 0.5f, 0 );
    // attach the oscil to the output so it makes sound
    wave.patch( out );
  }
  
  // this is called by the sequencer when the instrument should
  // stop making sound
  void noteOff()
  {
    wave.unpatch( out );
  }
}

void setup()
{
  size(650, 100);
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  //// when providing an Instrument, we always specify start time and duration
  //out.playNote( 0.0, 0.9, new SineInstrument( 97.99 ) );
  //out.playNote( 1.0, 0.9, new SineInstrument( 123.47 ) );
  
  //// we can use the Frequency class to create frequencies from pitch names
  //out.playNote( 2.0, 2.9, new SineInstrument( Frequency.ofPitch( "C3" ).asHz() ) );
  //out.playNote( 3.0, 1.9, new SineInstrument( Frequency.ofPitch( "E3" ).asHz() ) );
  //out.playNote( 4.0, 0.9, new SineInstrument( Frequency.ofPitch( "G3" ).asHz() ) );
}

void draw() {
  //Dibujamos las celdas/teclas
  for (int i=0;i<6;i++){
    rect(i*100+50,0,50,100);
  }
  
}

void mousePressed() {
  //Nota en función del valore de mouseX
  tecla=(int)(mouseX/50);
  println(tecla);
  
  out.playNote( 0.0, 1.9, new SineInstrument( Frequency.ofPitch( notas[tecla] ).asHz() ) );
  
 
  
}