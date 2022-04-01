/// @description Insert description here
// You can write your code in this editor

//if (keyboard_check(vk_space) && ite_rdy) {
//	instance_destroy(obj_square)
//	ite_rdy = false;
//	alarm[0] = 0.05 * room_speed;
//	++ite;
//	all_maps[1].iterate();
//	spawn_square(all_maps[1], true);
//}

//if (keyboard_check(vk_shift)) {
//	spawn_square();
//}

//if (keyboard_check(vk_enter)) {
//	instance_destroy(obj_square)
//}


if(loadCnt>=0){
	if(loadCnt<30){
		all_maps[current_level] = new cellular_automata(128, 128, 0.50, all_maps[current_level - 1]);
		all_maps[current_level].iterate(1);
		loadCnt++;
	}
	else{
		loadCnt = -1;
		all_maps[current_level].get_final_map();
		spawn_wall(all_maps[current_level]);
		instance_create_layer(px,py-98*32+10,layer,obj_player);
	}
}
else{
	if(obj_player.y>98*32){
		//loadCnt = 0;
		++current_level;
		if (all_maps[current_level] == noone) {
			all_maps[current_level] = new cellular_automata(128, 128, 0.50, all_maps[current_level - 1]);
			loadCnt = 0;
			px = obj_player.x;
			py = obj_player.y;
			instance_destroy(obj_player);
			//all_maps[current_level].iterate(num_iterations);
			//all_maps[current_level].get_final_map();
		}
		//spawn_square(all_maps[current_level], false);
		//spawn_wall(all_maps[current_level]);
		//obj_player.y -= 98*32;
	}
	else if(obj_player.y<0){
		--current_level;
		spawn_wall(all_maps[current_level]);
		obj_player.y += 98*32;
	}

	if (keyboard_check_pressed(vk_down)) {
		++current_level;
		if (all_maps[current_level] == noone) {
			all_maps[current_level] = new cellular_automata(128, 128, 0.50, all_maps[current_level - 1]);
			all_maps[current_level].iterate(num_iterations);
			all_maps[current_level].get_final_map();
		}
		//spawn_square(all_maps[current_level], false);
		spawn_wall(all_maps[current_level]);
	} else if (keyboard_check_pressed(vk_up)) {
		if (current_level > 0) {
			--current_level;
			//spawn_square(all_maps[current_level], current_level == 0 ? true : false);
			spawn_wall(all_maps[current_level]);
		}
	}
}

