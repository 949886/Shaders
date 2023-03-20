#define M_PI 3.1415926535897932384626433832795

float vx(float x,float y, float a)
{
    float l=1.0/sqrt(a*a+(1.0-a)*(1.0-a));
    float u=x*a-y*(1.0-a);
    float v=x*(1.0-a)+y*a;
    u*=l;
    v*=l;
//    return (sin(u)+sin(v)+2.0)/2.0;
    float scale=0.00043*iResolution.x;
    u=fract(u*scale)-0.5;
    v=fract(v*scale)-0.5;
	return 1.0-sqrt(u*u+v*v)*sqrt(2.0);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = (fragCoord.xy-iMouse.xy) / max(iResolution.x,iResolution.y)*4.0-0.5;
    float t=iTime;
    float r=length(uv);
	float a=atan(uv.x,uv.y)/M_PI/2.0+sin(r+t)*0.1;
	
    fragColor = vec4(
        vx(uv.x, uv.y,iMouse.x/iResolution.x*2.0-0.5),0,0,1
        );
//    return;
    
    fragColor = vec4(
         (r-sin(r*M_PI*2.0+t*4.0)*0.1-sin(a*M_PI*22.0+t*4.0)*0.1+sin(a*M_PI*12.0+t)*0.4-1.5)+vx(uv.x*150.0,uv.y*150.0,0.12)
        ,(r-sin(r*M_PI*3.0+t*5.0)*0.1-sin(a*M_PI*26.0+t*5.0)*0.1-sin(a*M_PI*8.0-t )*0.4-1.5)+vx(uv.x*150.0,uv.y*150.0,0.34)
        ,(r-sin(r*M_PI*2.0+t*8.0)*0.1-sin(a*M_PI*24.0+t*6.0)*0.1-sin(a*M_PI*10.0  )*0.4-1.5)+vx(uv.x*150.0,uv.y*150.0,0.69)
        ,1.0);
}