

draw_set_font(Font1);
draw_set_halign(fa_center)
draw_set_color(c_red);
draw_text(150, 20, "level: " + string(current_level));
draw_text(300, 20, "depth: " + string(player_depth));
draw_text(450, 20, "time: " + string(round(global.timer / room_speed)));



if (game_over) {
	draw_text(300, 275, "GAME OVER");
}

draw_set_color(c_white);