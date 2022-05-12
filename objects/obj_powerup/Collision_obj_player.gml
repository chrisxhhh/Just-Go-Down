/// @description Insert description here
// You can write your code in this editor

instance_destroy(id)


// [ hp+, exp+, gem+, gold+, slime+, explostion, freeze ]


switch powerup {
	
	
	case 0:
	audio_play_sound(sound_powerup, 10, false);
	obj_attr.player_hp += obj_attr.player_hp_max * 0.2;
	obj_attr.player_hp = clamp(obj_attr.player_hp, 0, obj_attr.player_hp_max);
	break;
	
	
	case 1:
	audio_play_sound(sound_powerup, 10, false);
	var _r = irandom_range(20, 30);
	_r *= obj_attr.attr_indicator[7];
	var _angle = 0;
	
	for (var _i = 0; _i < _r; ++_i) {
		
		_angle += 360 / _r;
		var _xoff = 120 * cos(_angle);
		var _yoff = 120 * sin(_angle);
		var _dir = _angle;
		
		var _new_coin = instance_create_depth(x + _xoff, y + _yoff, -3000, obj_exp);
		_new_coin.direction = _dir;
		_new_coin.speed = 8;
		_new_coin.gravity = .2;
		
	}
	break;
	
	
	case 2:
	audio_play_sound(sound_powerup, 10, false);
	for(var ii = 0; ii < 30 * obj_attr.attr_indicator[7]; ii++){
		inv_AddItem(ItemType.gem);
	}
	
	break;
	
	case 3:
	audio_play_sound(sound_powerup, 10, false);
	for(var ii = 0; ii < 30 * obj_attr.attr_indicator[7]; ii++){
		inv_AddItem(ItemType.gold);
	}
	
	break;

	// [ hp+, exp+, gem+, gold+, slime+, explostion, freeze ]

	case 4:
	audio_play_sound(sound_powerup, 10, false);
	for(var ii = 0; ii < 3 * obj_attr.attr_indicator[7]; ii++){
		inv_AddItem(ItemType.gun);
	}
	break;
	
	
	case 5:
	
	var _new_white = instance_create_depth(x, y, -18000, obj_white);
	_new_white.image_blend = make_color_rgb(74, 13, 0);
	audio_play_sound(sound_explosion, 10, false);
	
	var _r = obj_map.current_level;
	
	with(obj_enemy) {
		if irandom(_r) == 0 {
			instance_destroy(id);
		}
	}

	break;
	
	case 6:
	audio_play_sound(sound_freeze, 10, false);
	var _new_white = instance_create_depth(obj_player.x, obj_player.y, -18000, obj_white);
	_new_white.image_blend = make_color_rgb(2, 39, 68);
	part_type_color3(global.Particle1, c_aqua, c_white, c_blue);
	obj_storm_manager.is_red = false;
	obj_storm_manager.alarm[0] = 5 * room_speed;
	
	
	break;
	
}
