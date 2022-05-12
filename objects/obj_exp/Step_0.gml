gravity_direction = point_direction(x, y, obj_player.x, obj_player.y);
gravity += 0.05;
speed = clamp(speed, 0, 20);
if (point_distance(x, y, obj_player.x, obj_player.y) < 48) {

	audio_play_sound(sound_collect, 10, 0);
	instance_destroy(id);
	obj_attr.player_exp++;
	if (obj_attr.player_exp >= obj_attr.level_req[obj_attr.player_level]) {
		obj_attr.player_level++;
		obj_attr.player_hp = obj_attr.player_hp_max;
		obj_attr.levelup = true;
		obj_attr.level_points += 2;
	}
}