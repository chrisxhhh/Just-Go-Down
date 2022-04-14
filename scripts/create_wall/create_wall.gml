// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_wall(_x, _y){
	var rw = (_y div 32) mod 98;
	var cl = _x div 32;
	var mapNum = (_y div 32) div 98;
	var lay_id = layer_get_id("Tiles_Ground");
	var map_id = layer_tilemap_get_id(lay_id);
	if(rw-1 >=0){
		if(obj_map.all_maps[mapNum].final[cl][rw-1]==1){
			//show_debug_message("Draw grass!");
			//var data = tilemap_get(map_id, 4, 0);
			//tile_set_flip(data, true);
			tilemap_set_at_pixel(map_id, 3, _x, _y);
		}
		else{
			tilemap_set_at_pixel(map_id, 28, _x, _y);
		}
	}
	else{
		if(obj_map.all_maps[mapNum-1].final[cl][97]==1){
			//show_debug_message("Draw grass!");
			//var data = tilemap_get(map_id, 4, 0);
			//tile_set_flip(data, true);
			tilemap_set_at_pixel(map_id, 3, _x, _y);
		}
		else{
			tilemap_set_at_pixel(map_id, 28, _x, _y);
		}
	}
}