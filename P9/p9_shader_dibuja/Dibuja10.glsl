#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


void main() {
	//Normalizamos coordenadas con la resolución
	vec2 st = gl_FragCoord.xy/u_resolution;
	vec3 color = vec3(0.0);

    // step devuelve 1.0 (blanco) 0.0 (negro).
    float left = step(0.1,st.x);   // st.x>0.1
    float bottom = step(0.1,st.y); // st.y>0.1
    
    float right = step(0.1,1.0-st.x);   // st.x<0.9
    float top = step(0.1,1.0-st.y); // st.y<0.9

    // Mltiplicar equivale a AND
    color = vec3( left * bottom * top * right );

    gl_FragColor = vec4(color,1.0);
}