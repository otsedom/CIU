#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


void main() {
	//Normalizamos coordenadas con la resolución
	vec2 st = gl_FragCoord.xy/u_resolution;
	float pct = 0.0;

    // Distancia del píxel al centro
    pct = distance(st,vec2(0.5));
    
    // Blanco para píxeles con distancia menor que 0.2
    float circ = step(0.2,0.5-pct);

    vec3 color = vec3(circ);

	gl_FragColor = vec4( color, 1.0 );
}