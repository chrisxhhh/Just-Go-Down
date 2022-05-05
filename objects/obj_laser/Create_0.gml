/// @description Insert description here
// You can write your code in this editor
xEnd = 0;
yEnd = 0;
length_laser = 1;

TlayerID = layer_get_id("Tiles_Ground"); 
tilemapID = layer_tilemap_get_id(TlayerID); 
empty_tile = 0;

dmg_rdy = true;
dmg_timer = 0.5 * room_speed;
