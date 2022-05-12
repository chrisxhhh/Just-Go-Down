/// @description when attack animation end

if sprite_index = spr_wolf_attack{

	if position_meeting(x+22*image_xscale,y-10,obj_player){
		
		//obj_player.x_spd -= 3.5*-image_xscale
		//HEALTH -= dmg
		
		var _dmg = 10 * (1 + obj_map.current_level * 0.05);
		
		obj_attr.player_hp -= _dmg;

		//if (obj_attr.player_hp <= 0) {
		//	obj_map.respawn(obj_manager.check_point_y);
		//	obj_player.x = obj_manager.check_point_x;
		//	obj_player.y = obj_manager.check_point_y;
		//	obj_map.current_level = obj_player.y div (98 * 32);
		//	obj_attr.player_hp = obj_attr.player_hp_max;
		//}
		
		just_attack = true
		alarm[0] = 25
		
	}
}
