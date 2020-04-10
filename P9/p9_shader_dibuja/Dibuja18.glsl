#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

void main(){
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  st.x *= u_resolution.x/u_resolution.y;
  vec3 color = vec3(0.0);
  float d = 0.0;

  // Redimensiona al espacio -1,1
  st = st *2.-1.;
    
  // Rota el espacio, variando el ángulo en función del tiempo
  st = rotate2d( sin(u_time)*PI ) * st;

  // Número de sectores
  int N = 12;

  // Ángulo y radio del píxel actual
  float a = atan(st.x,st.y)+PI;
  float r = TWO_PI/float(N);
  
  // Distancia afectada por el módulo del sector
  d = cos(floor(.5+a/r)*r-a)*(length(st)+mod(a,r));
    
  color = vec3(1.0-smoothstep(.4,.41,d));
  
  gl_FragColor = vec4(color,1.0);
}