//Adaptado de fuente original http://www.magicandlove.com/blog/2018/08/06/openpose-in-processing-and-opencv-dnn/
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
import org.opencv.core.Core.MinMaxLocResult;
import org.opencv.dnn.*;
import java.util.*;

final int CELL = 46;
final int W = 368, H = 368;
final float THRESH = 0.1f;
static int pairs[][] = {
  {1, 2}, // left shoulder
  {1, 5}, // right shoulder
  {2, 3}, // left arm
  {3, 4}, // left forearm
  {5, 6}, // right arm
  {6, 7}, // right forearm
  {1, 8}, // left body
  {8, 9}, // left thigh
  {9, 10}, // left calf
  {1, 11}, // right body
  {11, 12}, // right thigh
  {12, 13}, // right calf
  {1, 0}, // neck
  {0, 14}, // left nose
  {14, 16}, // left eye
  {0, 15}, // right nose
  {15, 17}  // right eye
};
private float xRatio, yRatio;
private CVImage img;
private Net net;
private Capture cam;


public void setup() {
  size(320, 240);
  //Cámara
  cam = new Capture(this, width, height);
  cam.start();
    
  //OpenCV
  //Carga biblioteca core de OpenCV
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  println(Core.VERSION);
  img = new CVImage(W, H);
  

  //Carga modelos
  net = Dnn.readNetFromCaffe(dataPath("openpose_pose_coco.prototxt"), 
    dataPath("pose_iter_440000.caffemodel"));
  //net.setPreferableBackend(Dnn.DNN_BACKEND_DEFAULT);
  //net.setPreferableTarget(Dnn.DNN_TARGET_OPENCL);
  
  //Relación cámara ventana
  xRatio = (float)width / W;
  yRatio = (float)height / H;
}

public void draw() {
  if (cam.available()) { 
    //Lectura del sensor
    cam.read();
    background(0);
    //Muestra imagen capturada
    image(cam, 0, 0);
    
    //Obtiene imagen para procesamiento
    img.copy(cam, 0, 0, cam.width, cam.height, 
      0, 0, img.width, img.height);
    img.copyTo();
    //Procesa
    Mat blob = Dnn.blobFromImage(img.getBGR(), 1.0/255, 
      new Size(img.width, img.height), 
      new Scalar(0, 0, 0), false, false);
    net.setInput(blob);
    Mat result = net.forward().reshape(1, 19);
  
    ArrayList<Point> points = new ArrayList<Point>();
    for (int i=0; i<18; i++) {
      Mat heatmap = result.row(i).reshape(1, CELL);
      MinMaxLocResult mm = Core.minMaxLoc(heatmap);
      Point p = new Point();
      if (mm.maxVal > THRESH) {
        p = mm.maxLoc;
      }
      heatmap.release();
      points.add(p);
      }
  
    //Dibuja esqueleto
    float sx = (float)img.width*xRatio/CELL;
    float sy = (float)img.height*yRatio/CELL;
    pushStyle();
    noFill();
    strokeWeight(2);
    stroke(255, 255, 0);
    for (int n=0; n<pairs.length; n++) {
      Point a = points.get(pairs[n][0]).clone();
      Point b = points.get(pairs[n][1]).clone();
      if (a.x <= 0 ||
        a.y <= 0 ||
        b.x <= 0 ||
        b.y <= 0)
        continue;
      a.x *= sx;
      a.y *= sy;
      b.x *= sx;
      b.y *= sy;
      line((float)a.x, (float)a.y, 
        (float)b.x, (float)b.y);
    }
    popStyle();
    blob.release();
    result.release();
  }
}
