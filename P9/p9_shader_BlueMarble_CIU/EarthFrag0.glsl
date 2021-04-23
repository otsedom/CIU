uniform sampler2D texMap;
uniform sampler2D bumpMap;
uniform sampler2D specularMap;

uniform float bumpScale;

varying vec3 ecPosition;
varying vec3 ecNormal;
varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec4 vertSpecular;
varying float vertShininess;
varying vec3 lightDir;

void main() {  
  vec2 st = vertTexCoord.st;
  vec4 texColor = texture2D(texMap, st);
  
  gl_FragColor = texColor; //Textura de entrada  
}
