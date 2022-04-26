/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
//image_xscale = 0.5;
if(image_angle > 90 && image_angle < 270){
	image_yscale = -1;
}
else{
	image_yscale = 1;
}
x = obj_player.x;
y = obj_player.y;
