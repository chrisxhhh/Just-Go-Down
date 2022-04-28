/// @description Insert description here
// You can write your code in this editor
centered = abs(x - obj_attr.center_x) <= 100;
if (!leaving) {
	x = lerp(x, obj_attr.center_x, 0.2);
	
} else {
	if (x >= obj_attr.center_x + 960)
		instance_destroy(id);
	x = lerp(x, obj_attr.center_x + 1000, 0.2);
}
