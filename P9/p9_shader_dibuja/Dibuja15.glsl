#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float cuadro(vec2 _st,float th_w,float th_h){
    // step devuelve 1.0 (blanco) 0.0 (negro).
    float left = step(th_w,_st.x);   // st.x>0.1
    float bottom = step(th_h,_st.y); // st.y>0.1
    
    float right = step(th_w,1.0-_st.x);   // st.x<0.9
    float top = step(th_h,1.0-_st.y); // st.y<0.9
    
    return left*bottom*right*top;
}


void main() {
	//Normalizamos coordenadas con la resolución
	vec2 st = gl_FragCoord.xy/u_resolution;
	vec3 color = vec3(0.0);

    // Multiplicar equivale a AND
    color = vec3( cuadro(st,0.4,0.1) + cuadro(st,0.1,0.4) );

    gl_FragColor = vec4(color,1.0);
}