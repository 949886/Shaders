float4 main(in float2 uv: TEXCOORD0): SV_TARGET
{
    return float4(uv.x, abs(-uv.y), 0, 0.0);
}