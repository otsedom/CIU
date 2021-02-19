import gifAnimation.*;

GifMaker ficherogif;

void setup()
{
  size(400,400);
  stroke(0);
  
  //gif
  ficherogif = new GifMaker(this, "animacion.gif");
  ficherogif.setRepeat(0);        // animación sin fin
}

void draw()
{
  background(200);
  line(0,0,mouseX,mouseY);  
  
  ficherogif.addFrame();
}

void mousePressed() {
  ficherogif.finish();          // Finaliza captura y salva
}
