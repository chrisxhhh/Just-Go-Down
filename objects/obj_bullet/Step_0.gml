/// @description Insert description here
// You can write your code in this editor
var tile_id = tilemap_get_at_pixel(tilemapID,x, y);
if(tile_id != empty_tile){
	instance_destroy();
	//global.bCollideX = x;
	//global.bCollideY = y;
	if(tilemap_get_at_pixel(tilemapID,x-10, y)==empty_tile){
		with(instance_create_layer(x-12,y,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x,other.y-1);
			preDir = -1
		}
		with(instance_create_layer(x-12,y,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x,other.y+1);
			preDir = 1;
		}
	}
	else if(tilemap_get_at_pixel(tilemapID,x+10, y)==empty_tile){
		with(instance_create_layer(x+12,y,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x,other.y-1);
			preDir = 1;
		}
		with(instance_create_layer(x+12,y,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x,other.y+1);
			preDir = -1;
		}
	}
	else if(tilemap_get_at_pixel(tilemapID,x,y-10)==empty_tile){
		with(instance_create_layer(x,y-12,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x+1,other.y);
			preDir = -1;
		}
		with(instance_create_layer(x,y-12,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x-1,other.y);
			preDir = 1;
		}
	}
	else if(tilemap_get_at_pixel(tilemapID,x,y+10)==empty_tile){
		with(instance_create_layer(x,y+12,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x+1,other.y);
			preDir = 1;
		}
		with(instance_create_layer(x,y+12,"bullet",obj_bulletSplit)){
			direction = point_direction(other.x,other.y,other.x-1,other.y);
			preDir = -1;
		}
	}
	/*with(instance_create_layer(x,y,"bullet",obj_bulletSplit)){
		if(tilemap_get_at_pixel(tilemapID,x-10, y)==empty_tile || tilemap_get_at_pixel(tilemapID,x+10, y)==empty_tile){
			direction = point_direction(other.x,other.y,other.x,other.y-1);
		}
		else{
			direction = point_direction(other.x,other.y,other.x+1,other.y);
		}
	}*/
	
	//instance_create_layer(x,y,"bullet",obj_bulletSplit);
}
else if(abs(y-obj_player.y)>32*15){
	instance_destroy();
}
