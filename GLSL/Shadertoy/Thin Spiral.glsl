// Thin Spiral, mla, 2023

const float PI = 3.141592654;
float spiral = 1.0; // Number of arms on spiral, 0 for no spiral
float scale = 1.0;  // This can be any value in fact
float k = 0.6;      // Magic number - determined by experiment

// void mainImage( out vec4 fragColor, in vec2 fragCoord )
// {
//     // Set k from mouse
//     if (iMouse.x > 1.0) k = iMouse.x/iResolution.x; 
//     // Move origin to center of screen
//     fragCoord -= 0.5*iResolution.xy;
//     //  Scale to [-1,1]x[-1,1]
//     fragCoord /= scale;
//     // Rotate by iTime (in radians)
//     float d = length(fragCoord);
//     float px = fwidth(fragCoord.x); // Same as 1.0/scale
//     fragColor = vec4(0.5+0.5*cos(k*PI*d/px-2.0*PI*iTime+spiral*atan(fragCoord.y,fragCoord.x)));
//     //o *= 2.0/(1.0+o); // Maybe simple tone-mapping?
//     float g = 0.4545; // 0.7 for more balanced stripes
//     //if (iMouse.y > 0.0) g = iMouse.y/iResolution.y;
//     fragColor = pow(fragColor,vec4(g)); // Gamma correction always nice.
// }

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = gl_FragCoord.xy;

    // Move origin to center of screen
    uv -= 0.5 * iResolution.xy;

    // Set aspect ratio
    // uv *= iResolution.xy / min(iResolution.x, iResolution.y);

    // Convert to polar coordinates
    float r = length(uv);
    float a = atan(uv.y, uv.x);

    // Rotate by iTime
    float c = 0.3 * cos(r * 0.2 + a + iTime * 5.);

    fragColor = vec4(c, c, c, 1.0);
}
