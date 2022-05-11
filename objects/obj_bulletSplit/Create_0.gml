/// @description Insert description here
// You can write your code in this editor
//direction = point_direction(global.bCollideX,global.bCollideY, )
TlayerID = layer_get_id("Tiles_Ground"); 
tilemapID = layer_tilemap_get_id(TlayerID); 
empty_tile = 0;
speed = 3;
alarm[0] = 800;
preDir = -1;
/*if(tilemap_get_at_pixel(tilemapID,x+12*cos(degtorad(direction+90)),y-12*sin(degtorad(direction+90)))!=empty_tile){
	preDir = 1;
}
else{
	preDir = -1;
}
show_debug_message(string(preDir));*/
chDir = true;

arrowID = instance_create_layer(obj_player.x,obj_player.y,"instance",obj_arrow2);
