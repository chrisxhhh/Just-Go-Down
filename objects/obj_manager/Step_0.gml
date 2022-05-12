


//if (!game_over) {
//	--global.timer;
	
//	if (current_level == 0) {
//		player_depth = round(obj_player.y / 16) - 78;
//	} else if (current_level >= 0) {
//		player_depth = 20 + 100 * (current_level - 1) + round(obj_player.y / 16); 
//	}
	
//	/*
//	//this part is now moved into obj_map step
//	if (obj_player.y > room_height - 16) {
//		current_level++;
//		obj_player.y = 16;
//		obj_map.goto_level(current_level);
//	}
//	*/
//}


//if (global.timer < 0 && !game_over) {
//	instance_destroy(obj_player);
//	game_over = true;
//}

//spawning fireball

fire_ball_chance = base - obj_map.current_level * 5;
fire_ball_chance = clamp(fire_ball_chance, 75, base);

if ((!global.pause) && obj_map.current_level >= 4) {
	var _i = irandom(fire_ball_chance);
	if (_i == 0) {
		var _x = random_range(-400, 400);
		var _y = random_range(-400, 400);
		if (point_distance(0, 0, _x, _y) > 300)
			instance_create_depth(obj_player.x + _x, obj_player.y + _y, -8000, obj_fireball);
	}
}

if (keyboard_check_pressed(ord("R"))) {
	part_type_destroy(global.Particle1);
	part_emitter_destroy(global.P_System, global.Emitter1);
	part_system_destroy(global.P_System);
	game_restart();
}

if (keyboard_check_pressed(ord("Q"))) {
	obj_map.respawn(check_point_y);
	obj_player.x = check_point_x;
	obj_player.y = check_point_y;
	obj_map.current_level = obj_player.y div (98 * 32);
	
}


if not underground and obj_player.y > 2090 {
	layer_destroy("Tiles_fake_layer")
	underground = true
}

