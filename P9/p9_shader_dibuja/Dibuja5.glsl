#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float grosor=0.1;

float plot(vec2 st, float pct){
  //smoothstep da salida suave entre dos valores (Hermite)
  return  smoothstep( pct-grosor, pct, st.y) -
          smoothstep( pct, pct+grosor, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
	vec2 mouse= u_mouse/u_resolution.xy;
    
    vec3 color = vec3(st.x);	//Escala de grises izquierda a derecha;
	
	//Valor a tomar como referencia para bordes suaves
	float val = smoothstep(0.1,0.9,st.x);// interpolación Hermite
	//float val = mod(st.x,0.5); // Módulo de 0.5
	//float val = fract(st.x); // Parte fraccionaria
	//float val = ceil(st.x);  // Entero más cercano mayor o igual
	//float val = floor(st.x); // Entero más cercano menor o igual
	//float val = sign(st.x);  // Signo
	//float val = abs(st.x);   // Valor absoluto
	//float val = clamp(st.x,0.0,1.0); // Limitado entre 0 y 1
	//float val = min(0.0,st.x);   // Valor mínimo
	//float val = max(0.0,st.x);   // Valor máximo
	
	//Combina escala con línea según el valor de pct
	float pct = plot(st,val);
	// Valores altos verde, bajos escala de grises
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
	
	gl_FragColor = vec4(color,1.0);
}