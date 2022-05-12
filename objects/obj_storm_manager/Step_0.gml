
spd_base = spd_base_base * (1 + obj_map.current_level * 0.10)

if (pause) {
	
	speed = spd_base * 0.1;
	
} else {
	
	if (y > obj_player.y + 200) {
		speed = spd_base * 0.45;
	} else if (y > obj_player.y - 500) {
		speed = spd_base * 0.75;
	} else {
		speed = spd_base
	}
	
	
}



