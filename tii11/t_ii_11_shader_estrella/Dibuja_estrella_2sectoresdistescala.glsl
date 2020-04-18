#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  float d = 0.0;
  // Redimensiona al espacio -1,1
  st = st *2.-1.;    
  // Número de sectores
  int N = 5;
  // Ángulo del píxel actual
  float a = atan(st.y,st.x)+PI; // atan -PI,PI, sumo PI para tenerlo 0,2*PI
  // Incrementos de radianes
  float r = TWO_PI/float(N); //radianes por sector
  float r2 = r*0.5; //radianes por medio sector
  float sector = floor(a/r); // índice sector
  float sectorN = sector/float(N);  //ïndice sector normalizado entre 0-1
      
  //Vectores a pico y valle
  float rmax=0.7,rmin=0.2;    
     
  // Combinamos inversa de distancia al centro con step
  d = 1. - step(rmax,length(st));
  // Combina sector ángulo con step de distancia
  vec3 color = vec3(sectorN*d);
    
  gl_FragColor = vec4(vec3(color),1.0);
}