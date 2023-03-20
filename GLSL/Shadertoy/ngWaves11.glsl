void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float t = iTime*3.14159;
    fragCoord-= iResolution.xy*.5;
    vec2 uv = fragCoord/iResolution.y;
	uv*=2.;
    vec4 c = vec4(0.);
    float f = 0.;
        float a = atan(uv.y, uv.x);
        float d = length(uv);
    float s1 = -.1;
    float s2 = s1+(sin(t-d*6.)*.1+.15);
    for(float i = 0.; i<6.28; i+= 6.28/128.){
    	f += smoothstep(s1, s2,sin(a*(3.)-t+sin(i-t)*2.5)*.1*d+(d-i*.4));
    }
    f+=t;
    float spread = sin(t)*.1;
    c.rgb = sin((vec3(f-spread,f,f+spread))*6.)*.5+.5;
    fragColor = c;
}