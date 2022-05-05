if (hp <= 0) {
	instance_destroy(id);	
}


y_spd = 0
y_spd += grav_amt;  
 
xdist_to_player = x - obj_player.x
ydist_to_player = y - obj_player.y


if  my_health <= 0{
	instance_destroy()	
}

if tilemap_get_at_pixel(tilemapID,x,y) != empty_tile{
	y_spd -= grav_amt	
}

if abs(ydist_to_player) < 50{
	grav_amt = 3
}else{
	grav_amt = 0
}




if abs(ydist_to_player) < 25 and abs(xdist_to_player) < 200{
	image_xscale = -xdist_to_player/ abs(xdist_to_player)
	x_spd = 0.8 * image_xscale
	if (tilemap_get_at_pixel(tilemapID, x+(20)*image_xscale, y+8) == empty_tile) {
		x_spd = 0
		sprite_index = spr_wolf_attack
	}else{
		if just_attack {
			x_spd = 0
		}
		if abs(xdist_to_player) < 25 {
			x_spd = 0
			//if not just_attack{
			sprite_index = spr_wolf_attack
			
		
		
		}else{
			sprite_index = spr_wolf_move	
		}
	}
	
}
else{
	
	patrolAndStop()
}

wolf_moveCollide_horizontal()

x += x_spd
y += y_spd

