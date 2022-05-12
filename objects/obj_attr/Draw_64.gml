draw_set_font(Font1);




//hp bar

var _hp_x1 = 100;
var _hp_y1 = 5;
var _hp_x2 = 200;
var _hp_y2 = 15;

draw_set_color(c_red);
draw_rectangle(_hp_x1, _hp_y1, _hp_x1 + _hp_x2, _hp_y1 + _hp_y2, true);
draw_rectangle(_hp_x1, _hp_y1, _hp_x1 + _hp_x2 * player_hp/player_hp_max, _hp_y1 + _hp_y2, false);
draw_text(50, 6, "HP: ");

//exp bar

var _exp_x1 = 500;
var _exp_y1 = 5;
var _exp_x2 = 200;
var _exp_y2 = 15;

draw_set_color(c_aqua);
draw_rectangle(_exp_x1, _exp_y1, _exp_x1 + _exp_x2, _exp_y1 + _exp_y2, true);
draw_rectangle(_exp_x1, _exp_y1, _exp_x1 + _exp_x2 * ( (player_exp - level_req[player_level - 1]) / (level_req[player_level] - level_req[player_level - 1]) ), _exp_y1 + _exp_y2, false);
//draw_text(300, 300, "player_move_mul: " + string(player_move_mul));
//draw_text(300, 350, "player_atk_spd: " + string(player_atk_spd));

draw_text(400, 6, "LEVEL: " + string(player_level));
//draw_text(150, 200, string(player_exp) + " " + string(player_level));
//draw_text(400, 200, string(player_exp));

//points ctr
draw_set_color(c_orange);
draw_text(750, 6, "POINTS: " + string(level_points));

//mask bar
draw_set_color(c_yellow);

draw_text(50, 36, "Mask: ");

var _mask_x = 100;
var _mask_w = 30;
var _mask_step = 50;
var _mask_y1 = 35;
var _mask_y2 = 50;

for (var i = 0; i < mask_dur_max; i++) {
	var _x = _mask_x + i * _mask_step
	draw_rectangle(_x, _mask_y1, _x + _mask_w, _mask_y2, true);
}

for (var i = 0; i < mask_dur; i++) {
	var _x = _mask_x + i * _mask_step
	draw_rectangle(_x, _mask_y1, _x + _mask_w, _mask_y2, false);
}



draw_set_color(c_white);



var _left = 225;
var _top = 200;
var _h_step = 35;
var _h_step2 = 28;

var _right = 500;

draw_set_font(Font2);
if (instance_exists(obj_black_board)) {
	if (obj_black_board.centered) {
		
		draw_set_font(Font2);
		
		draw_set_color(c_red);
		draw_text(_left, 150, "HP: " + string(player_hp) + " / " + string(player_hp_max));
		
		draw_set_color(c_aqua);
		draw_text(_left + 200, 150, "EXP: " + string((player_exp - level_req[player_level - 1])) + " / " + string((level_req[player_level] - level_req[player_level - 1])));
		
		draw_set_color(c_orange);
		draw_text(_left + 400, 150, "POINTS: " + string(level_points));
		
		draw_set_color(c_white);
		
		
		draw_text(_left + 50, 500, "REPAIR MASK");
		//draw_sprite()
		
		
		draw_text(_left + 50, 530, "REFILL HP");
		
		
		
		for (var i = 0; i < len_stat; i++) {
			draw_text(_left, _top + i * _h_step, stat_indicator[i]);
			draw_text(_left + 50, _top + i * _h_step, stat_name[i]);
		}
		
		draw_set_font(Font3);
		for (var i = 0; i < len_attr; i++) {
			draw_text(_right + 200, _top + i * _h_step2, attr_indicator[i]);
			draw_text(_right, _top + i * _h_step2, attr_name[i]);
		}
		
		
		var _point_to = 0;
		
		if (window_mouse_get_x() > _left - 10 && window_mouse_get_x() < _right - 25) {
			for (var i = 0; i < len_stat; i++) {
				if (window_mouse_get_y() > _top + i * _h_step && window_mouse_get_y() < _top + (i + 1) * _h_step) {
					_point_to = i
					draw_set_alpha(0.4);
					draw_rectangle(_left - 10, _top + i * _h_step, _right - 25, _top + (i + 0.75) * _h_step, false);
					draw_set_alpha(1);	
					
					draw_set_color(c_yellow);
					for (var j = 0; j < len_attr; j++) {
						if (stat_map[i][j] != 0) {
							if (j == 0)
								draw_text(_right + 250, _top + j * _h_step2, "+" + string(stat_map[i][j]));
							else
								draw_text(_right + 250, _top + j * _h_step2, "+" + string(stat_map[i][j] / 100));
						}
					}
					draw_set_color(c_white);
					
					if (mouse_check_button_pressed(mb_left) && level_points > 0) {
						level_points--;
						stat_indicator[i]++;
						for (var j = 0; j < len_attr; j++) {
							if (stat_map[i][j] != 0) {
								if (j == 0) {
									attr_indicator[j] += stat_map[i][j];
									player_hp_max += stat_map[i][j];
									player_hp += stat_map[i][j];
									player_hp = clamp(player_hp, 0, player_hp_max);
								} else {
									attr_indicator[j] += stat_map[i][j] / 100;
								}
							}
						}
					}
				}
			}
		}
	}
}

draw_set_font(Font2);


//draw_set_font(Font2);
//if (instance_exists(obj_black_board)) {
//	if (obj_black_board.centered) {
//		draw_text(_left, 100, "HP: " + string(player_hp) + " / " + string(player_hp_max));
//		draw_text(_left + 200, 100, "EXP: " + string((player_exp - level_req[player_level - 1])) + " / " + string((level_req[player_level] - level_req[player_level - 1])));
//		draw_text(_left + 400, 100, "POINTS: " + string(level_points));
//		draw_text(_left, 135, "Luck: " + string(level_indicator[0]));
//		draw_text(_left, 170, "Movement Speed: " + string(level_indicator[1]));
//		draw_text(_left, 205, "Attack Damage: " + string(level_indicator[2]));
//		draw_text(_left, 240, "Attack Speed: " + string(level_indicator[3]));
//		draw_text(_left, 275, "View Distance: " + string(level_indicator[4]));
//		draw_text(_left, 310, "Max HP: " + string(level_indicator[5]));
		
//		draw_set_color(c_yellow);
//		draw_text(_left + 300, 135, "GOLD: " + string(num_gold));
//		draw_set_color(c_red);
//		draw_text(_left + 300, 170, "GEM: " + string(num_gem));
//		draw_set_color(c_white);
		
//		draw_set_color(c_white);
//		draw_set_alpha(0.15);
//		if (window_mouse_get_x() > 215 && window_mouse_get_x() < 450) {
//			if (window_mouse_get_y() > 135 && window_mouse_get_y() < 165) {
//				draw_rectangle(215, 135, 450, 165, false);
//			}
//			else if (window_mouse_get_y() > 170 && window_mouse_get_y() < 200) {
//				draw_rectangle(215, 170, 450, 200, false);
//			}
//			else if (window_mouse_get_y() > 205 && window_mouse_get_y() < 235) {
//				draw_rectangle(215, 205, 450, 235, false);
//			}
//			else if (window_mouse_get_y() > 240 && window_mouse_get_y() < 270) {
//				draw_rectangle(215, 240, 450, 270, false);
//			}
//			else if (window_mouse_get_y() > 275 && window_mouse_get_y() < 305) {
//				draw_rectangle(215, 275, 450, 305, false);
//			}
//			else if (window_mouse_get_y() > 310 && window_mouse_get_y() < 340) {
//				draw_rectangle(215, 310, 450, 340, false);
//			}
			
//		}
//		draw_set_color(c_white);
//		draw_set_alpha(1);
//	}
//}
draw_set_font(Font1);

