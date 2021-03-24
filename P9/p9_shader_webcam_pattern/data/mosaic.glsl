#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 texOffset;
uniform vec2 u_resolution;
uniform float u_time;

varying vec4 vertColor;
varying vec4 vertTexCoord;

float scale = 5.0;

void main(void) {
  vec2 stc = gl_FragCoord.xy/u_resolution;
  vec2 st = fract(vertTexCoord.st*scale); 
  
  // Traslación de filas pares
    float off = sin(u_time);
    if (sign(off)>0.)
    {
        if ( floor(mod(stc.y*scale,2.0)) == 1.)
    		st.x += off;
    }
    else
    {
        if ( floor(mod(stc.x*scale,2.0)) == 1.)
    		st.y += off;
    }
 
  vec4 sum = texture2D(texture, st);
  gl_FragColor = vec4(sum.rgb, 1.0) * vertColor;
}
