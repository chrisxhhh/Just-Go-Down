

if abs(obj_player.y-y) > 14*32{
	speed = 0
}else{
	speed = 0.5
	switch direction{
		case 0:
			check_x= x;
			check_y= y + 5*dir;
			check_xb = x;
			check_yb = y - 5*dir;
			break;
		case 90:
			check_x = x + 5*dir;
			check_y = y;
			check_xb = x - 5*dir;
			check_yb = y;
			break;
		case 180:
			check_x = x
			check_y = y - 5*dir
			check_xb = x;
			check_yb = y+5*dir;
			break;
		case 270:
			check_x = x - 5*dir
			check_y = y;
			check_xb = x + 5*dir;
			check_yb = y;
			break;
	}





	if((tilemap_get_at_pixel(tilemapID,check_x,check_y))!=empty_tile){
	
	
		direction -= 90*dir;
		image_angle -= 90*dir
	
	
		switch direction {
			case 90:
				y -= 20;
				break;
			case 180:
				x -= 20;
				break;
			case 0:
				x += 20;
				break;
			case 270:
				y += 20;
				break;
		}	
	
	
	}
	else if ((tilemap_get_at_pixel(tilemapID,check_xb,check_yb))==empty_tile){
		direction += 90*dir;
		image_angle += 90*dir
	
		switch direction {
			case 90:
				y -= 20;
				break;
			case 180:
				x -= 20;
				break;
			case 0:
				x += 20;
				break;
			case 270:
				y += 20;
				break;
		}	
	
	}
}

