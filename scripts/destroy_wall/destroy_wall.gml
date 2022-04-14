// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_wall(_x, _y){
	var lay_id = layer_get_id("Tiles_Ground");
	var map_id = layer_tilemap_get_id(lay_id);
	tilemap_set_at_pixel(map_id, 0, _x, _y);
}