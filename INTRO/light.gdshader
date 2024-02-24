shader_type canvas_item;

uniform float glow_radius : hint_range(0.0, 500.0);

void fragment() {
    // Hitung jarak dari piksel ke tengah
    float distance_to_center = distance(FRAGCOORD.xy, vec2(0.5, 0.5));

    // Hitung faktor glow berdasarkan jarak dari tengah
    float glow_factor = 1.0 - smoothstep(0.0, glow_radius, distance_to_center);

    // Tambahkan warna glow ke warna asli
    COLOR.rgb += glow_factor * vec3(1.0, 1.0, 0.0); // Anda dapat mengatur warna glow sesuai keinginan Anda
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
