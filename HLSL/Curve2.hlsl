// A simple hlsl shader that renders a spiral.

float iTime;
float2 iResolution;
float4 iMouse;

float4 main(in float2 uv: TEXCOORD0 ): SV_TARGET
{
    float2 p = uv * 2.0 - 1.0;
    p.x *= iResolution.x / iResolution.y;
    float a = atan2(p.y, p.x) / 3.1415926535897932384626433832795;
    float r = length(p);
    float d = abs(a - 0.5 * log(r) / 3.1415926535897932384626433832795);
    float f = 0.0;
    if (d < 0.01) f = 1.0;
    return float4(f, f, f, 1.0);
}

