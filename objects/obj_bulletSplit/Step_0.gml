/// @description Insert description here
// You can write your code in this editor
//show_debug_message("preDir");
//show_debug_message(string(sin(degtorad(direction))));
//show_debug_message(string(preDir));

/*if(tilemap_get_at_pixel(tilemapID,x+12*cos(degtorad(direction)),y-12*sin(degtorad(direction)))!=empty_tile){
	if(tilemap_get_at_pixel(tilemapID,x+12*cos(degtorad(direction+90)),y-12*sin(degtorad(direction+90)))==empty_tile){
		direction = direction+90;
	}
	else{
		direction = direction-90;
	}
}
else if(chDir && tilemap_get_at_pixel(tilemapID,x+12*cos(degtorad(direction+90)),y-12*sin(degtorad(direction+90)))==empty_tile && tilemap_get_at_pixel(tilemapID,x+12*cos(degtorad(direction-90)),y-12*sin(degtorad(direction-90)))==empty_tile){
	direction = direction + preDir*90;
	chDir = false;
	alarm[1] = 10;
}*/

if(has_wall(x+12*cos(degtorad(direction)),y-12*sin(degtorad(direction)))){
	if(!has_wall(x+12*cos(degtorad(direction+90)),y-12*sin(degtorad(direction+90)))){
		direction = direction+90;
	}
	else{
		direction = direction-90;
	}
}
else if(chDir && !has_wall(x+12*cos(degtorad(direction+90)),y-12*sin(degtorad(direction+90))) && !has_wall(x+12*cos(degtorad(direction-90)),y-12*sin(degtorad(direction-90)))){
	direction = direction + preDir*90;
	chDir = false;
	alarm[1] = 10;
}

with(arrowID){
	var adir = point_direction(obj_player.x,obj_player.y,other.x,other.y);
	image_angle = adir;
}
