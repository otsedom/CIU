#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;

void main() {
  // Copia color recibido del shader de vértices
  gl_FragColor = vertColor;
}