
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

/*
//legacy map genration after first map
if(loadCnt>=0){
	if(loadCnt<30){
		//all_maps[current_level] = new cellular_automata(128, 128, 0.50, all_maps[current_level - 1]);
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
	//when player reach the bottom edge of map
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
*/

#region generating new map
if(obj_player.y>48*32+current_level*98*32) and all_maps[current_level+1] == noone {
//if(obj_player.y>48*32+current_level*98*32) and all_maps[current_level+1] == 0 {
	loadCnt = 0; //start to generate next map
	line = 0
}
show_debug_message(string(loadCnt))
if loadCnt == 0 and line==0{
	
	//creating the initial 2d arrays for next map
	all_maps[current_level+1] = new cellular_automata(128, 128, 0.50, all_maps[current_level])	
	max_level++;
		
}else if loadCnt < num_iterations{
	//in each frame, iterate once, update 16 lines to new_map
	show_debug_message("max_level:")
	show_debug_message(max_level);
	all_maps[max_level].iterate_line(1,line)
	
}else if loadCnt == num_iterations{
	//when finished all iteration, create empty square room and covert to binary map
	map_loaded = true

	all_maps[max_level].create_room();
	//all_maps[max_level].get_final_map(true);
	all_maps[max_level].get_final_map();
	//max_level += 1
	
}

line += 16


if line > 127{
	loadCnt += 1
	line = 0
}
loadCnt = clamp(loadCnt,0,num_iterations+1) //restrict loadCnt btw 0 and iteration+1
if map_loaded {
	//spawn_wall(all_maps[max_level]);
	map_loaded = false;
}
if(keyboard_check(ord("W")) || keyboard_check(vk_space)){
	dynamic_spawn_up();
}
else{
	dynamic_spawn_down();
}
/*if(obj_player.vspd<0){
	dynamic_spawn_up();
}
else{
	dynamic_spawn_down();
}*/

if obj_player.y>98*32 + current_level*98*32{
	current_level++;
}
else if obj_player.y <= current_level*98*32{
	current_level--;
}
/*if current_level < max_level {
	map_loaded = true;	
}
//when player reach the bottom of the current map, spawn the next map and move palyer to top again
if obj_player.y>98*32{
	if map_loaded{
		++current_level;
		spawn_wall(all_maps[current_level]);

		obj_player.y = 8;
		if current_level == max_level{
			map_loaded = false
		}
	} else{
		obj_player.y = 98*32
	}
	
}
else if obj_player.y <= 0 {
	current_level--;
	spawn_wall(all_maps[current_level]);
	obj_player.y = 98*32;
}*/
#endregion
