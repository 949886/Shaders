
// A hlsl shader that draw halftone pattern
float iTime;
float2 iResolution;
Texture2D <float4> MyTex;


float4 main( float2 TexCoords : TEXCOORD ) : SV_Target
{
    return (float4)1.0;
}