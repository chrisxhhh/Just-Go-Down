/// @description Insert description here
// You can write your code in this editor
var lay_id = layer_get_id("Tiles_Ground");
var map_id = layer_tilemap_get_id(lay_id);
tilemap_set_at_pixel(map_id, 0, x, y);
