/// @description Insert description here
// You can write your code in this editor
x = obj_player.x;
y = obj_player.y;

direction = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);

var max_length = 500;
for (i = 0; i < max_length; i++) {
	xEnd = x + lengthdir_x(i, direction);
	yEnd = y + lengthdir_y(i, direction);
	length_laser = i;
	
	
	var tile_id = tilemap_get_at_pixel(tilemapID, xEnd, yEnd);
	
	if(tile_id!= empty_tile) {
		break;
	}
	if (collision_point(xEnd, yEnd, obj_enemy, 1, 1)){
		break;
	}
}

if (collision_circle(xEnd, yEnd, 16, obj_enemy, 1, 1) && dmg_rdy) {
	
	collision_circle(xEnd, yEnd, 16, obj_enemy, 1, 1).hp -= 3 * obj_attr.attr_indicator[2];
	dmg_rdy = false;
	alarm[0] = dmg_timer;
	
	
}
