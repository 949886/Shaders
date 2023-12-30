shader_type canvas_item;

uniform vec2 center;
uniform float force;
uniform float offset;

#define STEPS 7.0
#define INTERVAL 0.03

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 disp = normalize(UV - center) * force;
	COLOR = texture(TEXTURE, UV - disp);
	COLOR.r = texture(TEXTURE, vec2(UV.x + offset, UV.y) - disp).r;
	COLOR.g = texture(TEXTURE, vec2(UV.x - offset, UV.y) - disp).g;
	//float y = step(0.5 / STEPS, mod(UV.x, 1.0/STEPS));
	//float y = step(px, 0.5/STEPS + 0.1) - step(px, 0.5/STEPS - 0.1);
	//COLOR = vec4(vec3(y), 1.0);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
