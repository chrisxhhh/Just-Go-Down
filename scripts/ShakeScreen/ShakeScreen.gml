

function ShakeScreen(_dur, _amt){
	
	obj_screenshake.shake_dur = _dur * room_speed;
	obj_screenshake.shake_dur_max = obj_screenshake.shake_dur;
	obj_screenshake.shake_amt = _amt;
	obj_screenshake.current_x = camera_get_view_x(view_camera[0]);
	obj_screenshake.current_y = camera_get_view_y(view_camera[0]);
}
