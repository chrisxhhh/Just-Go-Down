// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*function create_wall(_x, _y){
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
}*/
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
		var up = 0;
		var down = 0;
		var left = 0;
		var right = 0;
		if(rw>0 && obj_map.all_maps[mapNum].final[cl][rw-1]>0){
			up = 1;
		}
		if(rw==0 && obj_map.all_maps[mapNum-1].final[cl][97]>0){
			up = 1;
		}
		if(rw<97 && obj_map.all_maps[mapNum].final[cl][rw+1]>0){
			down = 1;
		}
		if(rw==97 && obj_map.all_maps[mapNum+1].final[cl][0]>0){
			down = 1;
		}
		if(cl>0 && obj_map.all_maps[mapNum].final[cl-1][rw]>0){
			left = 1;
		}
		if(cl==0){
			left = 1;
		}
		if(cl<97 && obj_map.all_maps[mapNum].final[cl+1][rw]>0){
			right = 1;
		}
		if(cl==97){
			right = 1;
		}
		
		if(up==0 && down==0 && left==0 && right==0){
			/*if(obj_map.all_maps[mapNum].final[cl][rw] == -1){
				obj_map.id_map[cl][_y div 32] = 286;
				show_debug_message("set gold");
			}*/
			obj_map.id_map[cl][_y div 32] = 338;
			
			//obj_map.id_map[cl][_y div 32] = 338;
		}
		if(up==0 && down==0 && left==0 && right==1){
			obj_map.id_map[cl][_y div 32] = 373;
		}
		if(up==0 && down==0 && left==1 && right==0){
			obj_map.id_map[cl][_y div 32] = 371;
		}
		if(up==0 && down==1 && left==0 && right==0){
			obj_map.id_map[cl][_y div 32] = 423;
		}
		if(up==1 && down==0 && left==0 && right==0){
			obj_map.id_map[cl][_y div 32] = 332;
		}
		if(up==0 && down==0 && left==1 && right==1){
			obj_map.id_map[cl][_y div 32] = 147;
		}
		if(up==1 && down==1 && left==0 && right==0){
			obj_map.id_map[cl][_y div 32] = 189;
		}
		if(up==0 && down==1 && left==0 && right==1){
			obj_map.id_map[cl][_y div 32] = 348;
		}
		if(up==0 && down==1 && left==1 && right==0){
			obj_map.id_map[cl][_y div 32] = 345;
		}
		if(up==1 && down==0 && left==0 && right==1){
			obj_map.id_map[cl][_y div 32] = 267;
		}
		if(up==1 && down==0 && left==1 && right==0){
			obj_map.id_map[cl][_y div 32] = 266;
		}
		if(up==1 && down==1 && left==0 && right==1){
			obj_map.id_map[cl][_y div 32] = 134;
		}
		if(up==1 && down==1 && left==1 && right==0){
			obj_map.id_map[cl][_y div 32] = 130;
		}
		if(up==0 && down==1 && left==1 && right==1){
			obj_map.id_map[cl][_y div 32] = 458;
		}
		if(up==1 && down==0 && left==1 && right==1){
			obj_map.id_map[cl][_y div 32] = 91;
		}
		if(up==1 && down==1 && left==1 && right==1){
			obj_map.id_map[cl][_y div 32] = 109;
		}
		if(obj_map.all_maps[mapNum].final[cl][rw] == -1){
			obj_map.id_map[cl][_y div 32] = 286;
		}
		tilemap_set_at_pixel(map_id, obj_map.id_map[cl][_y div 32], _x, _y);
		
		/*if(rw-1 >=0){
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
					tilemap_set_at_pixel(map_id, 338, _x, _y);
					obj_map.id_map[cl][_y div 32] = 338;
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
		}*/
	}
}

