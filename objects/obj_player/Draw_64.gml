/// @description Insert description here
// You can write your code in this editor
//draw_text(50,130,"Dig");
draw_set_font(Font1);
draw_set_color(c_white);
draw_roundrect(30, 120, 90, 140, true);
draw_set_color(c_blue);


switch (weapon) {
	case 0:
	//empty
	draw_roundrect(31, 120, 90, 139, false);
	draw_set_color(c_white);
	draw_text(40, 124, "EMPTY");
	break;
	
	case 1:
	//shovel
	if(alarm[0] >= 0) {
		var len = 90-59*((alarm[0]) / dig_timer);
	}
	else{
		var len = 90;
	}
	draw_roundrect(31,120,len,139,false);
	draw_set_color(c_white);
	draw_text(48,124,"DIG");
	break;
	
	case 2:
	//gun
	if(alarm[1] >= 0) {
		var len = 90-59*((alarm[1]) / blt_timer);
	}
	else{
		var len = 90;
	}
	draw_roundrect(31,120,len,139,false);
	draw_set_color(c_white);
	draw_text(48,124,"GUN");
	break;
	
	case 3:
	//laser
	draw_roundrect(31, 120, 90, 139, false);
	draw_set_color(c_white);
	draw_text(40, 124, "LASER");
	break;
	
	
}
	
