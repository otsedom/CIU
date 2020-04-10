#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;

void main() {
  // Copia color del objeto
  gl_FragColor = vertColor;
}