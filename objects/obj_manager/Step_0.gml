


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

var _i = irandom(30);
if (_i == 0) {
	var _x = random_range(-400, 400);
	var _y = random_range(-400, 400);
	if (point_distance(0, 0, _x, _y) > 300)
		instance_create_depth(obj_player.x + _x, obj_player.y + _y, -8000, obj_fireball);
}

if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}

if (keyboard_check_pressed(ord("Q"))) {
	obj_map.respawn(check_point_y);
	obj_player.x = check_point_x;
	obj_player.y = check_point_y;
	obj_map.current_level = obj_player.y div (98 * 32);
	
}


//if (keyboard_check_pressed(ord("F"))) {
//	if !view_enabled
//	{
//	    view_visible[0] = true;
//	    view_enabled = true;
//	}
//	else {
//		view_visible[0] = false;
//	    view_enabled = false;
		
//	}
//}

