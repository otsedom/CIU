uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

uniform vec2 resolution; // Dimeniones lienzo (width,height)
uniform vec2 mouse;      // Posición del ratón en coordenadas de pantalla
uniform float time;      // Segundos desde carga

// 2D Random
float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
}



void main() {
  //gl_Position = transform * (position+vec2(random(vec2(position.x,position.y))));
  //gl_Position = transform * position;
  // move the position along the normal and transform it
  //vec4 newPosition = position + vec4(normal, 1.0) * sin(time)*20;
  vec4 newPosition = position + vec4(vec3(sin(time)*20), 1.0);
  gl_Position = transform * newPosition;
  vertColor = color;
  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = -lightNormal;
}