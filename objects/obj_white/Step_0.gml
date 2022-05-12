
image_alpha = alpha;
alpha = lerp(alpha, 0, 0.02);

if alpha <= 0 {
	instance_destroy(id);	
}
