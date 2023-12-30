// A HLSL shader draw a spiral

float iTime;
float2 iResolution;
float4 iMouse;

float4 main(in float2 uv: TEXCOORD0 ): SV_TARGET
{
    // Move origin to center of screen
    uv -= 0.5;

    // Set aspect ratio
    uv *= iResolution.xy / min(iResolution.x, iResolution.y);

    // Convert to polar coordinates
    float r = length(uv);
    float a = atan2(uv.y, uv.x);

    // Rotate by iTime
    float c = 0.5 * cos(r * 200 + a + iTime * 0.1);

    return (float4)c;
}

