/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_attr)) {
	if (obj_attr.player_hp <= 0 || keyboard_check_pressed(ord("L")) || obj_map.current_level == 30) {
		part_type_destroy(global.Particle1);
		part_emitter_destroy(global.P_System, global.Emitter1);
		part_system_destroy(global.P_System);
		room_goto(rm_end);
	}
}

if (instance_exists(obj_player)) {
	player_depth = floor((obj_player.y - 2060) / 32);
}

if (instance_exists(obj_attr)) {
	p_level = obj_attr.player_level;
}



if room == rm_end {
	
	if keyboard_check_pressed(vk_enter) {
		room_goto(Room1)
	}
	var _d = player_depth;
	var _l = p_level;
	
	
	//680 200
	
	
	while (_d > 0) {
		ds_list_add(list_depth, _d mod 10 + 30);
		_d = _d div 10;
	}
	
	while (_l > 0) {
		ds_list_add(list_level, _l mod 10 + 30);
		_l = _l div 10;
	}
	
	
}
