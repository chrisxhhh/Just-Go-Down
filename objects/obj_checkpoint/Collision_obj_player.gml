/// @description Insert description here
// You can write your code in this editor
//obj_manager.check_point_level = obj_manager.current_level = 0;
obj_manager.check_point_x = x;
obj_manager.check_point_y = y;
obj_manager.next_checkpoint = noone;

//if (current_level < 3) {
//	obj_manager.timer += 20;
//} else {
//	obj_manager.timer += 10;
//}

//global.timer += 20 * room_speed;

instance_destroy(self);