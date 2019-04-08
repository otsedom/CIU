#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

//Variables uniformes
uniform float fraction;
uniform vec2 resolution; // Dimeniones lienzo (width,height)
uniform vec2 mouse;      // Posición del ratón en coordenadas de pantalla
uniform float time;      // Segundos desde carga

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;



// 2D Random
float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
}

void main() {
  float intensity;
  vec4 color;
  intensity = max(0.0, dot(vertLightDir, vertNormal));

  if (intensity > pow(0.95, fraction)) {
    color = vec4(vec3(1.0), 1.0);
  } else if (intensity > pow(0.5, fraction)) {
    color = vec4(vec3(0.6), 1.0);
  } else if (intensity > pow(0.25, fraction)) {
    color = vec4(vec3(0.4), 1.0);
  } else {
    color = vec4(vec3(0.2), 1.0);
  }
  //color=vec4(sin(time),1.0,1.0, 1.0);

  //gl_FragColor = (color+random(gl_FragCoord.xy*mouse)) * vertColor;
  //gl_FragColor = (color+random(mouse)) * vertColor;
  //gl_FragColor = (color+ vec4(vec3(sin(time)*20), 1.0)) * vertColor;
  gl_FragColor = color * vertColor;
}