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
  float sector = floor(a/r); // ïndice sector
    
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
    
  // Producto vectorial, el signo z resultante establece si es interior o no
  // El criterio cambia en cada subsector, al usar un valle diferente
  vec3 cp = cross(vec3(vec2(st-pico),0.),vec3(vec2(st-valle),0.));
  if ( (fract(a/r)<=0.5 && sign(cp.z) < 0. ) 
        ||  (fract(a/r)>0.5 && sign(cp.z) > 0. )){
        d = 1. - step(rmax,length(st));
  }
  gl_FragColor = vec4(vec3(d),1.0);
}