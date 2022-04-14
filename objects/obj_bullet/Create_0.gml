/// @description Insert description here
// You can write your code in this editor

direction = point_direction(x, y, mouse_x, mouse_y);
direction = direction + random_range(-4, 4);
speed = 16;
image_angle = direction;
TlayerID = layer_get_id("Tiles_Ground"); 
tilemapID = layer_tilemap_get_id(TlayerID); 
empty_tile = 0;
