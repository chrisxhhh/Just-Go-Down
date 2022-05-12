/// @description Insert description here
// You can write your code in this editor

obj_attr.player_hp -= (1 * (1 + obj_map.current_level * 0.05)) / obj_attr.attr_indicator[5];

//if (obj_attr.player_hp <= 0) {
//	obj_map.respawn(obj_manager.check_point_y);
//	obj_player.x = obj_manager.check_point_x;
//	obj_player.y = obj_manager.check_point_y;
//	obj_map.current_level = obj_player.y div (98 * 32);
//	obj_attr.player_hp = obj_attr.player_hp_max;
//}
