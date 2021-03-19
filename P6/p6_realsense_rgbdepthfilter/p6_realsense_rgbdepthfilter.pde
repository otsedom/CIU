import ch.bildspur.realsense.*;
import ch.bildspur.realsense.type.*;

import ch.bildspur.realsense.processing.RSFilterBlock;
import org.intel.rs.processing.ThresholdFilter;
import org.intel.rs.types.Option;

RealSenseCamera camera = new RealSenseCamera(this);

RSFilterBlock thresholdFilter = new RSFilterBlock();

float minDistance = 0.0f;
float maxDistance = 4.0f;
float size = 1f;

void setup()
{
  size(1280, 480);
  
  // Activa entrada de color
  camera.enableColorStream(640, 480, 30);
  
  // Activa entrada de profundidad
  camera.enableDepthStream(640, 480);
  // Activa pseudocolor de profundidad
  camera.enableColorizer(ColorScheme.Cold);
  
  // Crea un filtro
  thresholdFilter.init(new ThresholdFilter());
  camera.addFilter(thresholdFilter);
  camera.start();
}

void draw()
{
  background(0);
  
  // Asocia la posición del ratón al centro de la distancia a filtrar
  float filterCenter = map(mouseX, 0, width, minDistance, maxDistance);
  
  //Define límites de profundidades a mostrar
  thresholdFilter.setOption(Option.MinDistance, minDistance);
  thresholdFilter.setOption(Option.MaxDistance, filterCenter);
  
  // Carga fotogramas
  camera.readFrames();
  
  // Muestra la imagen RGB
  image(camera.getColorImage(), 0, 0);
  // Muestra imagen de profundidad
  image(camera.getDepthImage(), width/2, 0);
}
