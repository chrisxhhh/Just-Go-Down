
hspd = ( keyboard_check(ord("D")) - keyboard_check(ord("A")) ) * mspd;
vspd = ( -(keyboard_check(ord("W")) || keyboard_check(vk_space)) ) * mspd;
//show_debug_message(hspd);
if (hspd != 0 || vspd != 0) {
	//audio_play_sound(sound_move, 0, false);
}

// collision check: 
var tile_ind = tilemap_get_at_pixel(tilemapID, x, y); 
if (tile_ind < 0) {
	show_debug_message("failed to check for collision here, index = "+string(tile_ind)); 	
} 

/*if (tilemap_get_at_pixel(tilemapID, x-sprite_xoffset-3, y) != empty_tile) {
	collided_left = true; 
} else collided_left =false;
if (tilemap_get_at_pixel(tilemapID, x+sprite_xoffset+3, y) != empty_tile ) {
	collided_right = true; 
} else collided_right =false;
if (tilemap_get_at_pixel(tilemapID, x, y-sprite_yoffset-3) != empty_tile) {
	collided_top = true; 
} else collided_top =false;
if (tilemap_get_at_pixel(tilemapID, x, y+sprite_yoffset+3) != empty_tile) {
	collided_bottom = true; 
} else collided_bottom =false;
*/
if (place_meeting(x-sprite_xoffset-3, y,obj_wall)) {
	collided_left = true; 
} else collided_left =false;
if (place_meeting(x+sprite_xoffset+3, y,obj_wall)) {
	collided_right = true; 
} else collided_right =false;
if (place_meeting(x, y-sprite_yoffset-3,obj_wall)) {
	collided_top = true; 
} else collided_top =false;
if (place_meeting(x, y+sprite_yoffset+3,obj_wall)) {
	collided_bottom = true; 
} else collided_bottom =false;

//show_debug_message("collided_bottom = " + string(collided_bottom)); 

//var _collided = tilemap_get_at_pixel(tilemapID, x, y) != empty_tile;
var inst_id = instance_position(x, y+sprite_yoffset+9, obj_wall);

if (dig_rdy) {
	/*if (_collided && keyboard_check(vk_down)) {
		dig_rdy = false;
		alarm[0] = dig_timer;
		tilemap_set(tilemapID, 166, floor(x/16), floor(y/16));
	} else if (collided_bottom && keyboard_check(vk_down)) {
		dig_rdy = false;
		alarm[0] = dig_timer;
		tilemap_set(tilemapID, 166, floor(x/16), floor(y/16) + 1);
	} else if (collided_left && keyboard_check(vk_left)) {
		dig_rdy = false;
		alarm[0] = dig_timer;
		tilemap_set(tilemapID, 166, floor(x/16) - 1, floor(y/16));
	} else if (collided_right && keyboard_check(vk_right)) {
		dig_rdy = false;
		alarm[0] = dig_timer;
		tilemap_set(tilemapID, 166, floor(x/16) + 1, floor(y/16));
	}*/
	if(inst_id != noone and keyboard_check(ord("F"))){
		instance_destroy(inst_id);
		var rw = (y+sprite_yoffset+9) div 32;
		var cl = x div 32;
		obj_map.all_maps[rw div 98].final[cl][rw mod 98] = 1;
	}
}





//hspd = hspd * !collided_left * !collided_right;  


if (hspd > 0) {
	hspd = hspd * !collided_right;
}  else if (hspd < 0) {
	hspd = hspd * !collided_left;
}

if (vspd < 0) {
	vspd = vspd * !collided_top;
}
//show_debug_message(hspd);
x += hspd; 
y += vspd; 
if (vspd == 0) y += grav * !collided_bottom;

cooldown = cooldown - 1;
if (mouse_check_button(mb_left)) && (cooldown < 1)
{
    instance_create_layer(x, y, "bullet", obj_bullet);
    cooldown = 30;
}
