#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;

void main() {
  //Asigna al fragmento/píxel el color recebido desde el shader de vértices
  gl_FragColor = vertColor;
}
