uniform sampler2D texMap;
uniform sampler2D alphaMap;

varying vec3 ecNormal;
varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec3 lightDir;

void main() {  
  vec2 st = vertTexCoord.st;
  //Una textutra, y canal alpha obtenido del otro mapa 
  vec4 texColor = vec4(texture2D(texMap, st).rgb, 1.0 - texture2D(alphaMap, st).r);
  
  //Obtiene intensidad por píxel, utilizando normal y vector hacia la luz
  vec3 direction = normalize(lightDir);
  float intensity = max(0.0, dot(direction, ecNormal));  
  vec4 diffuseColor = texColor * vec4(vec3(intensity), 1) * vertColor;

  gl_FragColor = diffuseColor;
}
