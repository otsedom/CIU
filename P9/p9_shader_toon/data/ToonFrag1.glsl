#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {  
  float intensity;
  // Producto escalar normal y vector hacia la fuente de luz
  intensity = max(0.0, dot(vertLightDir, vertNormal));

  // Color con únicamente reflexión difusa
  gl_FragColor = vec4(vec3(intensity),1.);  
}