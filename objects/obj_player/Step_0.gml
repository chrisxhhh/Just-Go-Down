mspd = base_spd * obj_attr.player_move_mul;
hspd = ( keyboard_check(ord("D")) - keyboard_check(ord("A")) ) * mspd;
vspd = ( -(keyboard_check(ord("W")) || keyboard_check(vk_space)) ) * mspd;



//show_debug_message(hspd);
if(!is_hurting && !is_attacking){
	if (hspd != 0) {
		//audio_play_sound(sound_move, 0, false);
		sprite_index = spr_player_walk;
		image_xscale = hspd/abs(hspd);
	}
	else{
		sprite_index = spr_player_idle;
	}
}
if(previoushp > obj_attr.player_hp){
	sprite_index = spr_player_hurt;
	is_hurting = true;
}
if(is_hurting){
	hurting_timer--;
}
if (is_attacking){
	attacking_timer--;
}
if(hurting_timer <=0){
	previoushp = obj_attr.player_hp;
	hurting_timer = 10;
	is_hurting = false;
}
if(attacking_timer<= 0){
	attacking_timer = 30;
	is_attacking = false;
}


// collision check: 
var tile_ind = tilemap_get_at_pixel(tilemapID, x, y); 
if (tile_ind < 0) {
	show_debug_message("failed to check for collision here, index = "+string(tile_ind)); 	
} 

/*if (tilemap_get_at_pixel(tilemapID, x-sprite_xoffset-3, y) != empty_tile) {
	collided_left = true; 
	show_debug_message("left");
} else collided_left =false;
if (tilemap_get_at_pixel(tilemapID, x+sprite_xoffset+3, y) != empty_tile ) {
	collided_right = true; 
	show_debug_message("right");
} else collided_right =false;
if (tilemap_get_at_pixel(tilemapID, x, y-sprite_yoffset-3) != empty_tile) {
	collided_top = true; 
	show_debug_message("top");
} else collided_top =false;
if (tilemap_get_at_pixel(tilemapID, x, y+sprite_yoffset+3) != empty_tile) {
	collided_bottom = true; 
	show_debug_message("bottom");
} else collided_bottom =false;
*/

if (tilemap_get_at_pixel(tilemapID, bbox_left-5, y) != empty_tile) {
	collided_left = true; 
	show_debug_message("left");
} else collided_left =false;
if (tilemap_get_at_pixel(tilemapID, bbox_right+5, y) != empty_tile ) {
	collided_right = true; 
	show_debug_message("right");
} else collided_right =false;
if (tilemap_get_at_pixel(tilemapID, x, bbox_top-5) != empty_tile) {
	collided_top = true; 
	show_debug_message("top");
} else collided_top =false;
if (tilemap_get_at_pixel(tilemapID, x, bbox_bottom+5) != empty_tile) {
	collided_bottom = true; 
	show_debug_message("bottom");
} else collided_bottom =false;

//dig
var mouse_deg = point_direction(x,y,mouse_x,mouse_y)
var tile_x = x
var tile_y = y
/*if (mouse_deg > 315 or mouse_deg <= 45 ){
	//right_block
	tile_x += sprite_xoffset+9
}else if (mouse_deg < 135 and mouse_deg > 45){
	//top_block
	tile_y -= sprite_yoffset+9
}else if (mouse_deg >= 135 and mouse_deg < 225){
	//left_block	
	tile_x -= sprite_xoffset+9
}else{
	//bot_block	
	tile_y += sprite_yoffset+9
}*/

if (mouse_deg > 315 or mouse_deg <= 45 ){
	//right_block
	tile_x = bbox_right+5;
}else if (mouse_deg < 135 and mouse_deg > 45){
	//top_block
	tile_y = bbox_top - 5;
}else if (mouse_deg >= 135 and mouse_deg < 225){
	//left_block	
	tile_x = bbox_left - 5;
}else{
	//bot_block	
	tile_y = bbox_bottom + 5;
}

var tile_id = tilemap_get_at_pixel(tilemapID,tile_x,tile_y);
if (dig_rdy) {
	
	if(tile_id != empty_tile and mouse_check_button(mb_left) and weapon == 1) {
		//instance_destroy(inst_id);
		dig_rdy = false;
		alarm[0] = dig_timer;
		
		tilemap_set_at_pixel(tilemapID, 0, tile_x,tile_y);
		var rw = tile_y div 32;
		var cl = tile_x div 32;
		if (obj_map.all_maps[rw div 98].final[cl][rw mod 98] == -1) {
			obj_attr.num_gold += 1;
		} else if (obj_map.all_maps[rw div 98].final[cl][rw mod 98] == -2) {
			obj_attr.num_gem += 1;
		}
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

if (!global.pause) {
		x += hspd; 
	if(prevspd==vspd){
		y += vspd;
	}

	if (vspd == 0 and prevspd==vspd) y += grav * !collided_bottom;

	if (mouse_check_button(mb_left) && weapon == 2 && blt_rdy)
	{
		blt_rdy = false;
		is_attacking = true;
		sprite_index = spr_player_attack;
	    instance_create_layer(x, y, "weapon", obj_bullet);
	    alarm[1] = blt_timer;
		
	}


	if (weapon==3)
	{
	  if (mouse_check_button(mb_left)){
		  if !( instance_exists(obj_laser)){
				is_attacking = true;
				sprite_index = spr_player_attack;
				instance_create_layer(x, y, "weapon", obj_laser);
		  }
	  }
	  if !(mouse_check_button(mb_left)){
		  instance_destroy(obj_laser);
	  }
  
	}
	prevspd = vspd;

	if(keyboard_check_pressed(ord("F"))){
		weapon = (weapon+1) mod 4;
		if(weapon==1){
		instance_destroy(obj_gun);
		instance_create_layer(x,y,"weapon",obj_shovel);
		}
		else if (weapon == 2 or weapon == 3){
			instance_destroy(obj_shovel);
			instance_create_layer(x,y,"weapon",obj_gun);
		}
		else{
			instance_destroy(obj_shovel);
			instance_destroy(obj_gun);
		}
	}

}




//attack speed mult
blt_timer = blt_init - obj_attr.player_atk_spd;
dig_timer = dig_init - 2 * obj_attr.player_atk_spd;

