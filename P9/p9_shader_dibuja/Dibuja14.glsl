#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

mat2 scale(vec2 _scale){
    return mat2(_scale.x,0.0,
                0.0,_scale.y);
}

void main() {
	//Normalizamos coordenadas con la resolución
	vec2 st = gl_FragCoord.xy/u_resolution;
	float pct = 0.0;
    
    // Mueve espacio al vec2(0.0)
    st -= vec2(0.5);
    // Escala el espacio, variando el ángulo en función del tiempo
    st = scale( vec2(sin(u_time)+1.0) ) * st;
    // Recoloca el espacio
    st += vec2(0.5);

    // Círculo
    pct = distance(st,vec2(0.5));
    float circ = step(0.3,0.5-pct)*st.x;       

    vec3 color = vec3(circ);

	gl_FragColor = vec4( color, 1.0 );
}