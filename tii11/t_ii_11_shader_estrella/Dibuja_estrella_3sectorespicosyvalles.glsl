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
  //Pico a mitad del sector
  float ang=sector*r;
  vec2 pico, valle;
  // Sector 0 cmienza en -PI coincide con valle (-rmin,0)
  // Pico en centro del sector, rota r2.  
  pico = vec2(-rmax*cos(ang+r2),-rmax*sin(ang+r2));
  // Valle a tomar difiere en cada mitad del sector  
  if (fract(a/r)<=0.5)
      valle =  vec2(-rmin*cos(ang),-rmin*sin(ang));
  else
      valle =  vec2(-rmin*cos(ang+r),-rmin*sin(ang+r));
    
  // Combinamos inversa de distancia al centro con step
  d = 1. - step(rmax,length(st));
  // Combina sector ángulo con step de distancia
  vec3 color = vec3(sectorN*d);
    
  //Pinta picos y valles
  vec3 colorpico = 
      vec3(0.,(sector+1.)*.2,0.),colorvalle = vec3((sector+1.)*.2,0.,0.); 
  // Valles  
  if ( (valle.x-0.02<st.x && valle.x+0.02>st.x 
        && valle.y-0.02<st.y && valle.y+0.02>st.y) )
        color = colorvalle;
  // Picos      
  if (  (pico.x-0.02<st.x && pico.x+0.02>st.x 
        && pico.y-0.02<st.y && pico.y+0.02>st.y) 
       )
        color = colorpico;      
    
  gl_FragColor = vec4(vec3(color),1.0);
}