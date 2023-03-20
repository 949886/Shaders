// A simple hlsl shader that renders auroras.

float iTime;
float2 iResolution;
float4 iMouse;

float4 main(in float2 uv: TEXCOORD0 ): SV_TARGET
{
    float2 p = uv * iResolution.xy;
    float2 m = iMouse.xy;
    float t = iTime * 0.1;

    float d = length(p - m);
    float a = atan2(p.y - m.y, p.x - m.x);

    float f = sin(d * 0.05 - t) * 0.5 + 0.5;
    f = pow(f, 20.0);

    float r = sin(a * 3.0 + t) * 0.5 + 0.5;
    float g = sin(a * 4.0 + t) * 0.5 + 0.5;
    float b = sin(a * 5.0 + t) * 0.5 + 0.5;

    return float4(r * f, g * f, b * f, 1.0);
}

