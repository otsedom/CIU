// Inspirado en Alma Haser
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;
uniform vec2 u_resolution;
uniform vec2 u_face;
uniform float u_facesy;
//uniform float u_time;

varying vec4 vertColor;
varying vec4 vertTexCoord;

float scale = 1.0;
float step = 0.05;

void main(void) {
  vec2 stc = gl_FragCoord.xy/u_resolution;
  vec2 face = u_face/u_resolution.xy;
  vec2 st = vertTexCoord.st*scale;   
  
  //sectores múltiplos de step
  int aux = int(float(u_facesy/u_resolution.y)/step)+1;
  
  if (face.x>=0 && face.y>=0){
    // Alterna columnas
    // Cierto rango
    if (stc.x>face.x && stc.y<1.0-face.y && stc.y>1.0-(face.y+float(aux*step))){// && stc.y<1.0-face.y){
      // Alterna filas
      if ( mod(stc.y*scale,2.0*step) <= step){
        // Desplaza en positivo con salto step
        if ( mod(stc.x*scale,2.0*step) <= step)
          st.x += (u_resolution.x*step)*texOffset.s;
        else // Desplaza en negativo
          st.x -= (u_resolution.x*step)*texOffset.s;
      }
    }    
  }

  vec4 sum = texture2D(texture, st);
  gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;
}
