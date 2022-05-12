center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;



if (keyboard_check_pressed(vk_escape)) {
	
	if (global.pause) {
		obj_black_board.leaving = true;
		instance_activate_all();
		//obj_map.load_dist = 15 + level_indicator[4];
		//obj_map.load_dist = clamp(obj_map.load_dist, 15, 30);
		//obj_storm_manager.speed = obj_storm_manager.spd_base;
		global.pause = false;
	} else {
		instance_create_depth(0, 0, -11000, obj_black_board);
		instance_deactivate_object(obj_enemy);
		instance_deactivate_object(obj_fireball);
		//obj_storm_manager.speed = obj_storm_manager.spd_base * 0.2;
		//instance_deactivate_all(true);
		//instance_activate_object(obj_black_board);
		//instance_activate_object(obj_cursor);
		//instance_activate_object(obj_map);
		global.pause = true;
	}
		
}

camera_set_view_size(view_camera[0], view_wport[0] * attr_indicator[6], view_hport[0] * attr_indicator[6]);
mask_cd	= mask_base * attr_indicator[8];


//if (instance_exists(obj_black_board)) {
//	if (obj_black_board.centered) {
//		if (mouse_check_button_pressed(mb_left) && level_points > 0) {
//			if (window_mouse_get_x() > 215 && window_mouse_get_x() < 450) {
//				if (window_mouse_get_y() > 135 && window_mouse_get_y() < 165) {
//					level_indicator[0]++;
//					player_luck += 0.2;
//					level_points--;
//				}
//				else if (window_mouse_get_y() > 170 && window_mouse_get_y() < 200) {
//					level_indicator[1]++;
//					player_move_mul += 0.1;
//					level_points--;
//				}
//				else if (window_mouse_get_y() > 205 && window_mouse_get_y() < 235) {
//					level_indicator[2]++;
//					player_atk_mul += 0.1;
//					level_points--;
//				}
//				else if (window_mouse_get_y() > 240 && window_mouse_get_y() < 270) {
//					level_indicator[3]++;
//					player_atk_spd += 1;
//					level_points--;
//				}	
//				else if (window_mouse_get_y() > 275 && window_mouse_get_y() < 305) {
//					level_indicator[4]++;
//					camera_mul += 0.02;
//					level_points--;
//					camera_set_view_size(view_camera[0], view_wport[0] * camera_mul, view_hport[0] * camera_mul);
//					//camera_set_view_size(view_camera[0], camera_get_view_width(view_camera[0]) * camera_mul, camera_get_view_height(view_camera[0]) * camera_mul);
//				}
//				else if (window_mouse_get_y() > 310 && window_mouse_get_y() < 340) {
//					level_indicator[5]++;
//					player_hp_max += 30;
//					player_hp += 30;
//					player_hp = clamp(player_hp, 0, player_hp_max);
//					level_points--;
//				}
//			}
//		}
//	}
//}

if (!pause && !in_storm) {
	if (obj_player.y < obj_storm_manager.y) {
		in_storm = true;
		alarm[0] = mask_cd;
	}
} 

if (obj_player.y > obj_storm_manager.y) {
	in_storm = false;
}


if (obj_player.y < obj_storm_manager.y && !pause && mask_dur == 0) {
	player_hp--;
}

if (obj_attr.player_hp <= 0) {
	obj_map.respawn(obj_manager.check_point_y);
	obj_player.x = obj_manager.check_point_x;
	obj_player.y = obj_manager.check_point_y;
	obj_map.current_level = obj_player.y div (98 * 32);
	obj_attr.player_hp = obj_attr.player_hp_max;
}


//camera_set_view_size(view_camera[0], view_wport[0] * camera_mul, view_hport[0] * camera_mul);

//if (keyboard_check(ord("O"))) {
	
//	camera_mul += 0.01;
//	obj_map.load_dist += 1;
//	obj_map.load_dist = clamp(obj_map.load_dist, 15, 30);
	
	
//	//player_move_mul += 0.01;
//	//obj_player.blt_timer -= 1;
	
//}

//level up [max_hp+, move+, atk+, atk_spd+, luck+, camera+]



