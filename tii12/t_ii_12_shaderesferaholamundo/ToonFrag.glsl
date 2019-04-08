#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float fraction;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  float intensity;
  intensity = max(0.0, dot(vertLightDir, vertNormal));

  gl_FragColor = intensity * vertColor;
}