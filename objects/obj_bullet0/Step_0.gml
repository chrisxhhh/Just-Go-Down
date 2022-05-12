/// @description Insert description here
// You can write your code in this editor
var tile_id = tilemap_get_at_pixel(tilemapID,x, y);
if(tile_id != empty_tile){
	instance_destroy();
	//global.bCollideX = x;
	//global.bCollideY = y;
	
}
else if(abs(y-obj_player.y)>32*15){
	instance_destroy();
}
