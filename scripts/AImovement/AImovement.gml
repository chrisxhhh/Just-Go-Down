// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function patrolAndStop(){
	if time_to_decide{
		dir = irandom_range(-1,1)
		distance = random_range(30,50) 
		distance_dir = distance * dir
		wait_time = irandom_range(20,50)	
		time_to_decide = false
		wait_round = 0
	}
	if abs(distance_covered) < abs(distance_dir){
		x_spd = 0.5 * dir
		distance_covered += x_spd
		sprite_index = walk_sprite
		/*
		if not position_meeting(x+5*dir,y+5,all){
			time_to_decide = true
			x_spd = 0
			sprite_index = idle_sprite
		}
		*/
		
		if (tilemap_get_at_pixel(tilemapID, x+(15)*dir, y-8) != empty_tile) or (tilemap_get_at_pixel(tilemapID, x+(20)*dir, y+8) == empty_tile) {
			
			time_to_decide = true
			x_spd = 0
			sprite_index = idle_sprite
		} 
		
	}else if dir == 0 and wait_round < wait_time {
		//just_set = true
		wait_round += 1
		x_spd = 0
		//alarm[0] = irandom_range(10,25)	
	}
	else{
		x_spd = 0
		time_to_decide = true
		distance_covered = 0
		sprite_index = spr_wolf_idle
	}

	if dir != 0{
		image_xscale = dir
	}
	
}

function wolf_moveCollide_horizontal(){
	if (tilemap_get_at_pixel(tilemapID,bbox_left, y-8) != empty_tile) {
		collided_left = true; 
	//show_debug_message("left");
	} else collided_left =false;
	if (tilemap_get_at_pixel(tilemapID, bbox_right, y-8) != empty_tile ) {
		collided_right = true; 
		//show_debug_message("right");
	} else collided_right =false;
	
	
	if (x_spd > 0) {
		x_spd = x_spd * !collided_right;
	}  else if (x_spd < 0) {
		x_spd = x_spd * !collided_left;
	}
	
	
	
}
