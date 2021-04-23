uniform sampler2D texMap;
uniform sampler2D alphaMap;

varying vec3 ecNormal;
varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec3 lightDir;

void main() {  
  vec2 st = vertTexCoord.st;
  //Aplica canal alpha, pero no iluminación
  vec4 texColor = vec4(texture2D(texMap, st).rgb, 1.0 - texture2D(alphaMap, st).r);
  //Combina textura y color
  vec4 diffuseColor = texColor * vertColor;

  gl_FragColor = diffuseColor;
}
