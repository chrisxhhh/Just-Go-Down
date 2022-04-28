// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_wall(_x, _y){
	var rw = (_y div 32) mod 98;
	var cl = _x div 32;
	var mapNum = (_y div 32) div 98;
	var lay_id = layer_get_id("Tiles_Ground");
	var map_id = layer_tilemap_get_id(lay_id);
	if(obj_map.id_map[cl][_y div 32] != 0){
		tilemap_set_at_pixel(map_id, obj_map.id_map[cl][_y div 32], _x, _y);
	}
	else{
		if(rw-1 >=0){
			if(obj_map.all_maps[mapNum].final[cl][rw-1]==1){
				//show_debug_message("Draw grass!");
				//var data = tilemap_get(map_id, 4, 0);
				//tile_set_flip(data, true);
				if(cl-1>=0 && obj_map.all_maps[mapNum].final[cl-1][rw]==1){
					tilemap_set_at_pixel(map_id, 2, _x, _y);
					obj_map.id_map[cl][_y div 32] = 2;
				}
				else if(cl+1<98 && obj_map.all_maps[mapNum].final[cl+1][rw]==1){
					tilemap_set_at_pixel(map_id, 4, _x, _y);
					obj_map.id_map[cl][_y div 32] = 4;
				}
				else{
					tilemap_set_at_pixel(map_id, 3, _x, _y);
					obj_map.id_map[cl][_y div 32] = 3;
				}
			}
			else if(rw+1<98 && obj_map.all_maps[mapNum].final[cl][rw+1]==1){
				tilemap_set_at_pixel(map_id, 103, _x, _y);
				obj_map.id_map[cl][_y div 32] = 103;
			}
			else if(rw+1==98 && obj_map.all_maps[mapNum+1].final[cl][0]==1){
				tilemap_set_at_pixel(map_id, 103, _x, _y);
				obj_map.id_map[cl][_y div 32] = 103;
			}
			else{
				if(cl-1>=0 && obj_map.all_maps[mapNum].final[cl-1][rw]==1){
					tilemap_set_at_pixel(map_id, 51, _x, _y);
					obj_map.id_map[cl][_y div 32] = 51;
				}
				else if(cl+1<98 && obj_map.all_maps[mapNum].final[cl+1][rw]==1){
					tilemap_set_at_pixel(map_id, 55, _x, _y);
					obj_map.id_map[cl][_y div 32] = 55;
				}
				else{
					tilemap_set_at_pixel(map_id, 28, _x, _y);
					obj_map.id_map[cl][_y div 32] = 28;
				}
			}
		}
		else{
			if(obj_map.all_maps[mapNum-1].final[cl][97]==1){
				//show_debug_message("Draw grass!");
				//var data = tilemap_get(map_id, 4, 0);
				//tile_set_flip(data, true);
				//tilemap_set_at_pixel(map_id, 3, _x, _y);
				//obj_map.id_map[cl][_y div 32] = 3;
				if(cl-1>=0 && obj_map.all_maps[mapNum].final[cl-1][rw]==1){
					tilemap_set_at_pixel(map_id, 2, _x, _y);
					obj_map.id_map[cl][_y div 32] = 2;
				}
				else if(cl+1<98 && obj_map.all_maps[mapNum].final[cl+1][rw]==1){
					tilemap_set_at_pixel(map_id, 4, _x, _y);
					obj_map.id_map[cl][_y div 32] = 4;
				}
				else{
					tilemap_set_at_pixel(map_id, 3, _x, _y);
					obj_map.id_map[cl][_y div 32] = 3;
				}
			}
			else if(rw+1<98 && obj_map.all_maps[mapNum].final[cl][rw+1]==1){
				tilemap_set_at_pixel(map_id, 103, _x, _y);
				obj_map.id_map[cl][_y div 32] = 103;
			}
			else if(rw+1==98 && obj_map.all_maps[mapNum+1].final[cl][0]==1){
				tilemap_set_at_pixel(map_id, 103, _x, _y);
				obj_map.id_map[cl][_y div 32] = 103;
			}
			else{
				//tilemap_set_at_pixel(map_id, 28, _x, _y);
				//obj_map.id_map[cl][_y div 32] = 28;
				if(cl-1>=0 && obj_map.all_maps[mapNum].final[cl-1][rw]==1){
					tilemap_set_at_pixel(map_id, 51, _x, _y);
					obj_map.id_map[cl][_y div 32] = 51;
				}
				else if(cl+1<98 && obj_map.all_maps[mapNum].final[cl+1][rw]==1){
					tilemap_set_at_pixel(map_id, 55, _x, _y);
					obj_map.id_map[cl][_y div 32] = 55;
				}
				else{
					tilemap_set_at_pixel(map_id, 28, _x, _y);
					obj_map.id_map[cl][_y div 32] = 28;
				}
			}
		}
	}
}