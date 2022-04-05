


if (!game_over) {
	--global.timer;
	
	if (current_level == 0) {
		player_depth = round(obj_player.y / 16) - 78;
	} else if (current_level >= 0) {
		player_depth = 20 + 100 * (current_level - 1) + round(obj_player.y / 16); 
	}
	
	/*
	//this part is now moved into obj_map step
	if (obj_player.y > room_height - 16) {
		current_level++;
		obj_player.y = 16;
		obj_map.goto_level(current_level);
	}
	*/
}


if (global.timer < 0 && !game_over) {
	instance_destroy(obj_player);
	game_over = true;
}

if (game_over && keyboard_check_pressed(ord("R"))) {
	game_restart();
}


if (keyboard_check_pressed(ord("F"))) {
	if !view_enabled
	{
	    view_visible[0] = true;
	    view_enabled = true;
	}
	else {
		view_visible[0] = false;
	    view_enabled = false;
		
	}
}
