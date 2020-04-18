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
  int N = 12;
  // Ángulo y radio del píxel actual
  float a = atan(st.y,st.x)+PI;
  float r = TWO_PI/float(N);
  
  // Afectamos de forma diferente sectores pares e impares
  if (floor( mod(a/r,2.))>=1.)
  		d = 1.;
  
  vec3 color = vec3(d);

  gl_FragColor = vec4(color,1.0);
}