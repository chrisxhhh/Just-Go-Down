gravity_direction = point_direction(x, y, obj_player.x, obj_player.y);
gravity += 0.05;
speed = clamp(speed, 0, 20);
if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {
	instance_destroy(id);
	obj_player.coins++;
}