base_spd = 3;
mspd = base_spd; 
hspd = 0; 
vspd = 0;
prevspd = 0;

grav = 5;

//TlayerID = layer_get_id("Tiles_Floor"); 
TlayerID = layer_get_id("Tiles_Ground"); 
tilemapID = layer_tilemap_get_id(TlayerID); 

collided_top = false; 
collided_bottom = false; 
collided_left = false; 
collided_right = false; 




//empty_tile = 166;
empty_tile = 0;

dig_rdy = true;
dig_init = 1 * room_speed;
dig_timer = dig_init;

blt_rdy = true;
blt_init = 0.5 * room_speed;
blt_timer = blt_init;

previoushp = 50;
is_hurting = false;
hurting_timer = 10;

is_attacking = false;
attacking_timer = 30;


coins = 0;
weapon = 0;
