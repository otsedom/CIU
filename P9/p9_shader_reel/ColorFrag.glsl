#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float u_time;

varying vec4 vertColor;

void main() {
  if (sign(sin(u_time*10.)) == 1)
  	// Copia color del objeto
  	gl_FragColor = vertColor;
  else
    // Invierte el color
    gl_FragColor = vec4(vec3(1) - vertColor.xyz, 1);
}
