/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = 0;

var rw = (y div 32) mod 98;
var cl = x div 32;
var mapNum = (y div 32) div 98;
var lay_id = layer_get_id("Tiles_Ground");
var map_id = layer_tilemap_get_id(lay_id);
if(rw-1 >=0){
	if(obj_map.all_maps[mapNum].final[cl][rw-1]==1){
		//show_debug_message("Draw grass!");
		//var data = tilemap_get(map_id, 4, 0);
		//tile_set_flip(data, true);
		tilemap_set_at_pixel(map_id, 3, x, y);
	}
	else{
		tilemap_set_at_pixel(map_id, 28, x, y);
	}
}
else{
	if(obj_map.all_maps[mapNum-1].final[cl][97]==1){
		//show_debug_message("Draw grass!");
		//var data = tilemap_get(map_id, 4, 0);
		//tile_set_flip(data, true);
		tilemap_set_at_pixel(map_id, 3, x, y);
	}
	else{
		tilemap_set_at_pixel(map_id, 28, x, y);
	}
}
