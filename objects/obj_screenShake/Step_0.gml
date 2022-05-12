if (shake_dur > 0){
	

	shake_dur --;
	
	var proportion = shake_dur / shake_dur_max;
	
	shake_x = random_range(-shake_amt, shake_amt) * proportion;
	shake_y = random_range(-shake_amt, shake_amt) * proportion;
	current_x = camera_get_view_x(view_camera[0]);
	current_y = camera_get_view_y(view_camera[0]);
	
	//camera_set_view_target(view_camera[0], noone);
	camera_set_view_pos(view_camera[0], current_x+shake_x, current_y+shake_y);
} else {
	camera_set_view_target(view_camera[0], obj_player)
	//camera_set_view_pos(view_camera[0], 0, 0);
	//camera_set_view_pos(view_camera[0],0,0);
}
