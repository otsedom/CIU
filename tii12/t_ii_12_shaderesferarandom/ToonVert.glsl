uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

uniform float time;      // Segundos desde carga

// 2D Random
float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
}



void main() {
  // Desplaza en la dirección de la normal integrando información del tiempo pasado
  vec4 newPosition = position + vec4(normal, 1.0) * random(vec2(time))*5;
  gl_Position = transform * newPosition;
  vertColor = color;
  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = -lightNormal;
}