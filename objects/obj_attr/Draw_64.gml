draw_set_color(c_red);
draw_rectangle(150, 35, 250, 50, true);
draw_rectangle(150, 35, 150 + 100 * player_hp/player_hp_max, 50, false);
draw_set_color(c_yellow);
draw_rectangle(150, 75, 250, 90, true);
draw_rectangle(150, 75, 150 + 100 * ( (player_exp - level_req[player_level - 1]) / (level_req[player_level] - level_req[player_level - 1]) ), 90, false);
draw_text(150, 120, "player level: " + string(player_level));
//draw_text(150, 200, string(player_exp) + " " + string(player_level));
//draw_text(400, 200, string(player_exp));
draw_set_color(c_white);