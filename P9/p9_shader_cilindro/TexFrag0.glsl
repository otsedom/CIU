#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  // Combina color del objeto con la textura
  gl_FragColor = texture2D(texture, vertTexCoord.st) * vertColor;
}