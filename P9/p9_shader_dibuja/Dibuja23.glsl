#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.141592

uniform vec2 u_resolution;
uniform float u_time;

float scale = 3.0;

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;
    vec3 color = vec3(0.0);
    
    st.x +=max(0.,sin(u_time));
    st.y -=max(0.,-sin(u_time));

    //Escala en función de la escala adoptada
    st = fract(st*scale); 
    
    // Dibuja un círculo en cada "celda"
    float pct = max(-sin(u_time),sin(u_time));
    color = vec3(circle(st,0.5*pct));

	gl_FragColor = vec4(color,1.0);
}