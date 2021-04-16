import java.lang.*;
import processing.video.*;
import cvimage.*;
import org.opencv.core.*;
//Detectores
import org.opencv.objdetect.CascadeClassifier;
import org.opencv.objdetect.Objdetect;

Capture cam;
CVImage img;

PShader sh;  
boolean enabled = true;

int bestFacex,bestFacey,bestsy;

//Cascadas para detección
CascadeClassifier face;
//Nombres de modelos
String faceFile;

void setup() {
  size(640, 480, P3D);
  //Cámara
  cam = new Capture(this, width , height);
  cam.start(); 
  
  //OpenCV
  //Carga biblioteca core de OpenCV
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  println(Core.VERSION);
  img = new CVImage(cam.width, cam.height);
  
  //Detector
  faceFile = "haarcascade_frontalface_default.xml";
  face = new CascadeClassifier(dataPath(faceFile));
  
  sh = loadShader("haser.glsl");
  bestFacex=-1;
  bestFacey=-1;
  bestsy=-1;
}

void draw() {  
  if (cam.available()) {
    shader(sh);
    background(0);
    cam.read();
    
     //Obtiene la imagen de la cámara
    img.copy(cam, 0, 0, cam.width, cam.height, 
    0, 0, img.width, img.height);
    img.copyTo();
    
    //Imagen de grises
    Mat gris = img.getGrey();
    
    //Detección y pintado de contenedores
    FaceDetect(gris, false);    
    
    gris.release();
    
    sh.set("u_resolution", float(width), float(height));
    sh.set("u_face", float(bestFacex), float(bestFacey));
    sh.set("u_facesy", float(bestsy));
    println(bestFacex,bestFacey);
    image(cam, 0, 0);    
   
  }
}

void FaceDetect(Mat grey, boolean drawBBs)
{
  //Detección de rostros
  MatOfRect faces = new MatOfRect();
  face.detectMultiScale(grey, faces, 1.15, 3, 
    Objdetect.CASCADE_SCALE_IMAGE, 
    new Size(60, 60), new Size(200, 200));
  Rect [] facesArr = faces.toArray();
  
   //Dibuja contenedores
  noFill();
  stroke(255,0,0);
  strokeWeight(4);
  if (drawBBs){
    for (Rect r : facesArr) {    
      rect(r.x, r.y, r.width, r.height);   
     }
  }
  
  //Mayor cara
  bestFacex=-1;
  bestFacey=-1;
  bestsy=-1;
  long largestface=0;
  for (Rect r : facesArr) {    
    //Gets largets face upper left corner
    if (r.width*r.height>largestface){
      largestface=r.width*r.height;
      bestFacex=r.x;
      bestFacey=r.y;
      bestsy=r.height;
    }    
  }
  
  faces.release();
}

void mousePressed() {
  enabled = !enabled;
  if (!enabled == true) {
    resetShader();
  }
}
