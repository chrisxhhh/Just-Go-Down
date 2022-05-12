
/*var lay_id = layer_get_id("Tiles_Ground");
var map_id = layer_tilemap_get_id(lay_id);
var data = tilemap_get(map_id, 4, 0);
tile_set_flip(data, true);
tilemap_set_at_pixel(map_id, 4, obj_player.x, obj_player.y);
*/

//spawn_square = function(_map, _ground = false) {
//	instance_destroy(obj_square)
	
//	var _spacing = sprite_get_width(spr_square_white)
	
//	for (var col = 0; col < _map.width; col += 1) {
//		for (var row = 0; row < _map.height; row += 1) {
//			//show_debug_message(string(col)+" , "+string(row))
//			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
//				if (_ground) {
//					if (row > 128 - 45 && row < 128 - 35)
//						set_color(_map.map[col][row], 75, 105);
//						//set_color(_map.map[col][row]);
//					else
//						set_color(_map.map[col][row]);
//				} else 
//					set_color(_map.map[col][row]);
//			}
//		}
//	}
//}


/*
//legacy function for creating walls
spawn_square = function(_map, _ground = false) {
	instance_destroy(obj_square);
	var _spacing = sprite_get_width(spr_square_white);
	for (var col = 0; col < 98; ++col) {
		for (var row = 0; row < 98; ++row) {
			//show_debug_message(string(col)+" , "+string(row))
			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
				if (_map.final[col][row] == 0) {
					image_blend = c_black;
				} else if (_map.final[col][row] == 1) {
					
				} else if (_map.final[col][row] == 2) {
					image_blend = c_blue;
				}
			}
		}
	}
}
*/

/*
//legacy function to create map with tiles
create_map = function(_map, _ground = false) {

    // var _spacing = sprite_get_width(spr_square_white)
    var tiles_layerID = layer_get_id("Tiles_Floor"); 
    var tilemapID = layer_tilemap_get_id(tiles_layerID);
    tilemap_clear(tilemapID, 166);  

    for (var col = 0; col < 98; col += 1) {
        for (var row = 0; row < 98; row += 1) {
			if (_map.final[col][row] == 0) {
				//var tile_ind = get_tile_index(_map, col, row);
				tilemap_set(tilemapID, 165, col, row);
			} else {
				tilemap_set(tilemapID, 166, col, row);
			}
			
			
		}
    }
}
*/

/*
goto_level = function(_level) {
	instance_destroy(obj_checkpoint);
	if (all_maps[_level] == noone) {
		all_maps[_level] = new cellular_automata(128, 128, 0.50, all_maps[_level - 1]);
		all_maps[_level].iterate(num_iterations);
		all_maps[_level].get_final_map();
	}
	instance_create_layer((all_maps[_level].special_x-15) * 16, (all_maps[_level].special_y-15) * 16, "Instances", obj_checkpoint);
	create_map(all_maps[_level], false);
}
*/

//create wall objects according to _map
//_map is a binary 2d array. 1 is empty, 0 is solid
spawn_wall = function(_map) {
	show_debug_message("start spawn walls: " + string(current_time))
	//instance_destroy(obj_wall); //clear current map
	var _spacing = sprite_get_width(spr_square_wall);

	for (var col = 0; col < 98; ++col) {
		for (var row = 0; row < 98; ++row) {
			if (_map.final[col][row] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(col * _spacing,(max_level)*98*32+row * _spacing, layer, obj_wall);
				id_map[col][(max_level)*98+row] = iid;
			}
		}
	}
	show_debug_message("end spawn walls: " + string(current_time))
}

dynamic_spawn_down = function(){
	var _spacing = sprite_get_width(spr_square_wall);
	
	var r = obj_player.y div 32;
	for(var offset = -1; offset<=1;offset++){
		for(var i=0;i<98;i++){
			if(r-load_dist+offset>=0){
				if(create_map[i][r-load_dist+offset]==1){
					//instance_destroy(id_map[i][r-load_dist]);
					//var iid = instance_nearest(i*32,(r-load_dist)*32,obj_wall);
					//instance_destroy(iid);
					destroy_wall(i*32,(r-load_dist+offset)*32);
					create_map[i][r-load_dist+offset] = 0;
				}
				else if (create_map[i][r-load_dist+offset]==3){
					instance_deactivate_object(id_map[i][r-load_dist+offset])	
				}
			
				//var iid = instance_nearest(i*32,(r-load_dist)*32,obj_wall);
			
			}
			/*if(r-load_dist-1>=0){
				if(create_map[i][r-load_dist-1]==1){
					instance_destroy(id_map[i][r-load_dist-1]);
					create_map[i][r-load_dist-1] = 0;
				}
			}
			if(r-load_dist+1>=0){
				if(create_map[i][r-load_dist+1]==1){
					instance_destroy(id_map[i][r-load_dist+1]);
					create_map[i][r-load_dist+1] = 0;
				}
			}
			if ((r+load_dist-1)<98*32 and all_maps[(r+load_dist-1) div 98].final[i][(r+load_dist-1) mod 98] == 0 and create_map[i][r+load_dist-1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r+load_dist-1) * _spacing, layer, obj_wall);
				id_map[i][(r+load_dist-1)] = iid;
				create_map[i][r+load_dist-1] = 1;
			}*/
			if ((r+load_dist+offset)<98*32 and all_maps[(r+load_dist+offset) div 98].final[i][(r+load_dist+offset) mod 98] <= 0 and create_map[i][r+load_dist+offset] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				//var iid = instance_create_layer(i * _spacing,(r+load_dist) * _spacing, layer, obj_wall);
				//instance_create_layer(i * _spacing,(r+load_dist) * _spacing, layer, obj_wall);
				create_wall(i * _spacing,(r+load_dist+offset) * _spacing);
				//show_debug_message(string(iid));
				//id_map[i][(r+load_dist)] = iid;
				create_map[i][r+load_dist+offset] = 1;
			}
			/*if ((r+load_dist+1)<98*32 and all_maps[(r+load_dist+1) div 98].final[i][(r+load_dist+1) mod 98] == 0 and create_map[i][r+load_dist+1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r+load_dist+1) * _spacing, layer, obj_wall);
				id_map[i][(r+load_dist+1)] = iid;
				create_map[i][r+load_dist+1] = 1;
			}
		
			if ((r+load_dist-1)<98*32 and all_maps[(r+load_dist-1) div 98].final[i][(r+load_dist-1) mod 98] == 2 and create_map[i][r+load_dist-1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r+load_dist-1) * _spacing, layer, obj_monster1);
				id_map[i][(r+load_dist-1)] = iid;
				create_map[i][r+load_dist-1] = 1;
			}*/
			if ((r+load_dist+offset)<98*32 and all_maps[(r+load_dist+offset) div 98].final[i][(r+load_dist+offset) mod 98] == 2 and create_map[i][r+load_dist+offset] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r+load_dist+offset) * _spacing, "enemy_layer", obj_monster1);
				//instance_create_layer(i * _spacing,(r+load_dist) * _spacing, layer, obj_monster1);
				//create_wall()
				id_map[i][(r+load_dist+offset)] = iid;
				create_map[i][r+load_dist+offset] = 2;
			}
			if ((r+load_dist+offset)<98*32 and  all_maps[(r+load_dist+offset) div 98].final[i][(r+load_dist+offset) mod 98] == 3 ){
				if (create_map[i][r+load_dist+offset] == 0){
					//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
					var iid = instance_create_layer(i * _spacing,(r+load_dist+offset) * _spacing+_spacing, "enemy_layer", obj_wolf);
					//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_monster1);
					id_map[i][(r+load_dist+offset)] = iid;
					create_map[i][r+load_dist+offset] = 3;
				}
				else if (create_map[i][r+load_dist+offset] == 3){
					show_debug_message("wolf activated down"+string(id_map[i][(r+load_dist+offset)]))
					instance_activate_object(id_map[i][(r+load_dist+offset)])	
				}
			}
			if ((r+load_dist+offset)<98*32 and  all_maps[(r+load_dist+offset) div 98].final[i][(r+load_dist+offset) mod 98] == 4){
				if (create_map[i][r+load_dist+offset] == 0){
					var iid = instance_create_layer(i * _spacing,(r+load_dist+offset) * _spacing+_spacing, "enemy_layer",obj_centipede)
					id_map[i][(r+load_dist+offset)] = iid;
					create_map[i][r+load_dist+offset] = 4;
				}
			
			
			}
			/*if ((r+load_dist+1)<98*32 and all_maps[(r+load_dist+1) div 98].final[i][(r+load_dist+1) mod 98] == 2 and create_map[i][r+load_dist+1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r+load_dist+1) * _spacing, layer, obj_monster1);
				id_map[i][(r+load_dist+1)] = iid;
				create_map[i][r+load_dist+1] = 1;
			}*/
		}
	}
}

dynamic_spawn_up = function(){
	var _spacing = sprite_get_width(spr_square_wall);
	
	var r = obj_player.y div 32;
	for(var offset=-1;offset<=1;offset++){
		for(var i=0;i<98;i++){
			/*if(r+load_dist-1<98*32){
				if(create_map[i][r+load_dist-1]==1){
					instance_destroy(id_map[i][r+load_dist-1]);
					create_map[i][r+load_dist-1] = 0;
				}
			}*/
			if(r+load_dist+offset<98*32){
				if(create_map[i][r+load_dist+offset]==1){
					//instance_destroy(id_map[i][r+load_dist]);
					//var iid = instance_nearest(i*32,(r+load_dist)*32,obj_wall);
					//instance_destroy(iid);
					destroy_wall(i*32,(r+load_dist+offset)*32);
					create_map[i][r+load_dist+offset] = 0;
				}
				else if (create_map[i][r+load_dist+offset]==3){
					instance_deactivate_object(id_map[i][r+load_dist+offset])	
				}
			}
			/*if(r+load_dist+1<98*32){
				if(create_map[i][r+load_dist+1]==1){
					instance_destroy(id_map[i][r+load_dist+1]);
					create_map[i][r+load_dist+1] = 0;
				}
			}*/
			if ((r-load_dist+offset)>=0 and all_maps[(r-load_dist+offset) div 98].final[i][(r-load_dist+offset) mod 98] <= 0 and create_map[i][r-load_dist+offset] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				//var iid = instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_wall);
				//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_wall);
				create_wall(i * _spacing,(r-load_dist+offset) * _spacing);
				//id_map[i][(r-load_dist)] = iid;
				create_map[i][r-load_dist+offset] = 1;
			}
			/*if ((r-load_dist-1)>=0 and all_maps[(r-load_dist-1) div 98].final[i][(r-load_dist-1) mod 98] == 0 and create_map[i][r-load_dist-1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r-load_dist-1) * _spacing, layer, obj_wall);
				id_map[i][(r-load_dist-1)] = iid;
				create_map[i][r-load_dist-1] = 1;
			}
			if ((r-load_dist+1)>=0 and all_maps[(r-load_dist+1) div 98].final[i][(r-load_dist+1) mod 98] == 0 and create_map[i][r-load_dist+1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r-load_dist+1) * _spacing, layer, obj_wall);
				id_map[i][(r-load_dist+1)] = iid;
				create_map[i][r-load_dist+1] = 1;
			}*/
		
			if ((r-load_dist+offset)>=0 and all_maps[(r-load_dist+offset) div 98].final[i][(r-load_dist+offset) mod 98] == 2 and create_map[i][r-load_dist+offset] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r-load_dist+offset) * _spacing+_spacing, "enemy_layer", obj_monster1);
				//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_monster1);
				id_map[i][(r-load_dist+offset)] = iid;
				create_map[i][r-load_dist+offset] = 2;
			}
			if ( (r-load_dist+offset)>=0 and all_maps[(r-load_dist+offset) div 98].final[i][(r-load_dist+offset) mod 98] == 3 ){
				if (create_map[i][r-load_dist+offset] == 0){
					//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
					var iid = instance_create_layer(i * _spacing,(r-load_dist+offset) * _spacing, "enemy_layer", obj_wolf);
					//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_monster1);
					id_map[i][(r-load_dist+offset)] = iid;
					create_map[i][r-load_dist+offset] = 3;
				}
				else if (create_map[i][r-load_dist+offset] == 3){
					show_debug_message("wolf activated top")
					instance_activate_object(id_map[i][(r-load_dist+offset)])	
				}
			}
			if ((r+load_dist+offset)>=0 and  all_maps[(r-load_dist+offset) div 98].final[i][(r-load_dist+offset) mod 98] == 4){
				if (create_map[i][r-load_dist+offset] == 0){
					var iid = instance_create_layer(i * _spacing,(r-load_dist+offset) * _spacing, "enemy_layer", obj_centipede);
					id_map[i][(r-load_dist+offset)] = iid;
					create_map[i][r-load_dist+offset] = 4;
				}
			
			
			}
			/*if ((r-load_dist-1)>=0 and all_maps[(r-load_dist-1) div 98].final[i][(r-load_dist-1) mod 98] == 2 and create_map[i][r-load_dist-1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r-load_dist-1) * _spacing, layer, obj_monster1);
				id_map[i][(r-load_dist-1)] = iid;
				create_map[i][r-load_dist-1] = 1;
			}
			if ((r-load_dist+1)>=0 and all_maps[(r-load_dist+1) div 98].final[i][(r-load_dist+1) mod 98] == 2 and create_map[i][r-load_dist+1] == 0){
				//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(i * _spacing,(r-load_dist+1) * _spacing, layer, obj_monster1);
				id_map[i][(r-load_dist+1)] = iid;
				create_map[i][r-load_dist+1] = 1;
			}*/
		}
	}
}

respawn = function(_ty){
	var _spacing = sprite_get_width(spr_square_wall);
	var r = obj_player.y div 32;
	var tr = _ty div 32;
	for(var rw=r-load_dist; rw<=r+load_dist; rw++){
		for(var cl=0;cl<98;cl++){
			if(create_map[cl][rw]==1){
				//instance_destroy(id_map[cl][rw]);
				//var iid = instance_nearest(i*32,(r+load_dist)*32,obj_wall);
				//instance_destroy(iid);
				destroy_wall(cl*32,(rw)*32);
				create_map[cl][rw] = 0;
			}
			else if (create_map[cl][rw]==3){
				instance_deactivate_object(id_map[cl][rw])	
			}
		}
	}
	for(var rw=tr-load_dist; rw<=tr+load_dist; rw++){
		for(var cl=0;cl<98;cl++){
			/*if(create_map[cl][rw]==0){
				//instance_destroy(id_map[i][r+load_dist]);
				//var iid = instance_nearest(i*32,(r+load_dist)*32,obj_wall);
				//instance_destroy(iid);
				//create_wall(cl*32,(rw)*32);
				var iid = instance_create_layer()
				create_map[cl][rw] = 1;
			}*/
			if (rw>=0 and rw<98*32 and all_maps[(rw) div 98].final[cl][(rw) mod 98] <= 0 and create_map[cl][rw] == 0){
			//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				//var iid = instance_create_layer(cl * _spacing,(rw) * _spacing, layer, obj_wall);
				//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_wall);
				create_wall(cl * _spacing,(rw) * _spacing);
				//id_map[cl][(rw)] = iid;
				create_map[cl][rw] = 1;
			}
			if (rw>=0 and rw<98*32 and all_maps[(rw) div 98].final[cl][(rw) mod 98] == 2 and create_map[cl][rw] == 0){
			//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
				var iid = instance_create_layer(cl * _spacing,(rw) * _spacing, "enemy_layer", obj_monster1);
				//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_wall);
				//create_wall(i * _spacing,(r-load_dist) * _spacing);
				id_map[cl][(rw)] = iid;
				create_map[cl][rw] = 2;
			}
			if rw>=0 and rw<98*32 and all_maps[(rw) div 98].final[cl][(rw) mod 98] == 3  {
				if ( create_map[cl][rw] == 0){
			//instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
					var iid = instance_create_layer(cl * _spacing,(rw) * _spacing+_spacing, "enemy_layer", obj_wolf);
				//instance_create_layer(i * _spacing,(r-load_dist) * _spacing, layer, obj_wall);
				//create_wall(i * _spacing,(r-load_dist) * _spacing);
					id_map[cl][(rw)] = iid;
					create_map[cl][rw] = 3;
				}
				else if  create_map[cl][rw] == 3 {
					instance_activate_object(id_map[cl][rw])	
				}
			}
			if rw>=0 and rw<98*32 and all_maps[(rw) div 98].final[cl][(rw) mod 98] == 4  {
				if ( create_map[cl][rw] == 0){
					var iid = instance_create_layer(cl * _spacing,(rw) * _spacing, "enemy_layer", obj_centipede);
					id_map[cl][(rw)] = iid;
					create_map[cl][rw] = 3;
				}
			}
		}
	}
}

load_dist       = 15;
ite_rdy			= true;
num_iterations	= 25;
current_level	= 0;
all_maps		= array_create(32, noone);
//all_maps		= array_create(32, 0);
id_map			= array_create(98,0);
create_map		= array_create(98,0);
//test_map		= array_create(98,0);
loadCnt			= num_iterations+1; //not generateing if larger than num_iteration
line			= 0
next_checkpoint = noone;
map_loaded = false;
max_level = 0;
global.bCollideX = 0;
global.bCollideY = 0;
randomize();

#region initialize first map
for(var _r = 0;_r<98;_r++){
	id_map[_r] = array_create(32*98,0);
	create_map[_r] = array_create(32*98,0);
	//test_map[_r] = array_create(32*98,0);
}
all_maps[0] = new cellular_automata(128, 128, 0.50, all_maps[0]);
/*for(var _r = 1; _r<32; _r++){
	all_maps[_r] = new cellular_automata(128, 128, 0.50, all_maps[_r-1]);
	all_maps[_r].iterate(num_iterations);
	all_maps[_r].get_final_map();
}*/
show_debug_message("start iteration: " + string(current_time))
all_maps[0].iterate(num_iterations);
show_debug_message("covert to binary map: " + string(current_time))
all_maps[0].get_final_map(true);
show_debug_message("finish coverting binary map: " + string(current_time))
//spawn_square(all_maps[0], true);
//spawn_wall(all_maps[0]);
#endregion


