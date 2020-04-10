#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float grosor=0.02;

vec3 colorA = vec3(0.149,0.141,0.912);
vec3 colorB = vec3(1.000,0.833,0.224);

float plot(vec2 st, float pct){
  //smoothstep da salida suave entre dos valores (Hermite)
  return  smoothstep( pct-grosor, pct, st.y) -
          smoothstep( pct, pct+grosor, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
	vec2 mouse= u_mouse/u_resolution.xy;
    
    //Valor a tomar como referencia para bordes suaves
	float val = st.x;
	
	vec3 color = mix(colorA, colorB, val);	//Escala entre dos colores
		
	//Combina escala con línea según el valor de pct
	float pct = plot(st,val);
	// Mezcl en función val
	color = mix(color,vec3(0.0,1.0,0.0),pct);
	
	gl_FragColor = vec4(color,1.0);
}