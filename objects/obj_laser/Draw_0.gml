/// @description Insert description here
// You can write your code in this editor

draw_line(x, y, xEnd, yEnd);
for (j=0; j< length_laser;j++){
	draw_sprite_ext(spr_laser,1,  x + lengthdir_x(j,direction), y + lengthdir_y(j, direction), 0.2, 0.2, direction, c_white, 1);
}
