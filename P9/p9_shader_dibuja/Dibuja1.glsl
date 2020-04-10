#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float grosor=0.05;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    
    vec3 color = vec3(st.x);	//Escala de grises izquierda a derecha;
	// Línea    
	if (st.y-grosor<st.x && st.x<st.y+grosor)
		color = vec3(0.0,1.0,0.0);	//Verde
	
	gl_FragColor = vec4(color,1.0);
}