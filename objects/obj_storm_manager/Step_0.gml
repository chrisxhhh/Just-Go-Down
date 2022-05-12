
spd_base = spd_base_base * (1 + obj_map.current_level * 0.10)

if (is_red) {
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
} else {
	speed = 0;
}

	


if (!audio_is_playing(sound_fire) && y > obj_player.y - 300) {
	audio_play_sound(sound_fire, 10, true);
}

if (y <= obj_player.y - 300) {
	audio_stop_sound(sound_fire);
}


