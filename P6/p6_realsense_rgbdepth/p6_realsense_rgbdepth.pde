import ch.bildspur.realsense.*;
import ch.bildspur.realsense.type.*;

RealSenseCamera camera = new RealSenseCamera(this);

void setup()
{
  size(1280, 480);
  
  // Activa entrada de color
  camera.enableColorStream(640, 480, 30);
  
  // Activa entrada de profundidad
  camera.enableDepthStream(640, 480);
  // Activa pseudocolor de profundidad
  camera.enableColorizer(ColorScheme.Cold);
  camera.start();
}

void draw()
{
  background(0);
  
  // Carga forogramas
  camera.readFrames();
  
  // Muestra la imagen RGB
  image(camera.getColorImage(), 0, 0);
  // Muestra imagen de profundidad
  image(camera.getDepthImage(), width/2, 0);
}
