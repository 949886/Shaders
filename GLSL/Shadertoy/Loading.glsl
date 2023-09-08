precision highp float;

// Constants
#define PI 3.1415925359
#define TAU 6.2831852
#define STEPS 7.0
#define INTERVAL 0.03

// Parameters
#define POSITION_Y 0.5
#define HEIGHT 1.0
#define AMPLITUDE 1.0
#define FREQUENCY 0.2

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec4 color =  vec4(0.0, 0.5, 1.0, 1.0);

    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    // Create a periodic function 
    float px = mod(uv.x, 1.0/STEPS);
    // Create a step function
    float sy = floor(uv.x * STEPS) / STEPS; 

    // The output is 1 if the pixel is in the interval [0.5/STEPS - INTERVAL, 0.5/STEPS + INTERVAL]
    color *= step(px, 0.5/STEPS + INTERVAL) - step(px, 0.5/STEPS - INTERVAL);

    // Change the opacity of the x axis periodically
    // Opacity oscillates between -1 and 1 by time
    float fade_by_x_time = sin(iTime + uv.x); 
    color *= fade_by_x_time;

    // Change the height of the wave periodically
    float oscillate_y_by_time = abs(mod(iTime * FREQUENCY, AMPLITUDE) - AMPLITUDE * 0.5) * (0.5 * sin((sy + iTime) * TAU) + 0.5);
    // float oscillate_y_by_time = 0.25 *( sin((sy + iTime) * TAU) + 1) * AMPLITUDE;    
    // Move position of the wave
	color *= step(abs(uv.y - POSITION_Y) + oscillate_y_by_time, HEIGHT * 0.5);
 
    fragColor = color;
}