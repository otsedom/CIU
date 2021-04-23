uniform mat4 modelviewMatrix;
uniform mat4 transformMatrix;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;

uniform vec4 lightPosition;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;
attribute vec4 specular;
attribute float shininess;

varying vec3 ecPosition;
varying vec3 ecNormal;
varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec4 vertSpecular;
varying float vertShininess;

varying vec3 lightDir;

void main() {
  //Vértice en coordenadas transformadas 
  gl_Position = transformMatrix * position; 
  //Posición del vértice en coordenadas del ojo
  ecPosition = vec3(modelviewMatrix * position);  
  //Normal del vértice en coordenadas del ojo
  ecNormal = normalize(normalMatrix * normal);
  //Características de reflexión
  vertSpecular = specular;
  vertShininess = shininess;
  //Coordenada de textura
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
  //Vector hacia la luz normalizado
  lightDir = normalize(lightPosition.xyz - ecPosition);  
  //Color del vértice
  vertColor = color;
}
