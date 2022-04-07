
mspd = 3; 
hspd = 0; 
vspd = 0;
prevspd = 0;

grav = 5;

TlayerID = layer_get_id("Tiles_Floor"); 
tilemapID = layer_tilemap_get_id(TlayerID); 

collided_top = false; 
collided_bottom = false; 
collided_left = false; 
collided_right = false; 

empty_tile = 166;

dig_rdy = true;
dig_timer = 1 * room_speed;

cooldown = 0;
