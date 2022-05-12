

switch state {
	
	case 0:
	x = lerp(x, 480, 0.05);
	if (abs(x - 480) < 1) {
		state = 1;
	}
	break;
	
	
	case 1:
	if keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		state = 2;
	}
	break;
	
	
	case 2:
	y = lerp(y, 2400, 0.05);
	if (abs(y - 2400) < 1)
		state = 3;
	break;
	
	
	case 3:
	if keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		state = 4;
	}
	break;
	
	
	
	case 4:
	y = lerp(y, 1824, 0.05);
	if (abs(y - 1824) < 1)
		state = 5;
	break;
	
	
	case 5:
	if keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		state = 6;
	}
	break;
	
	
	case 6:
	y = lerp(y, 992, 0.05);
	if (abs(y - 992) < 1)
		state = 7;
	break;
	
	
	case 7:
	if keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		state = 8;
	}
	break;
	
	
	case 8:
	y = lerp(y, 352, 0.05);
	image_xscale = lerp(image_xscale, 0.75, 0.005);
	image_yscale = lerp(image_yscale, 0.75, 0.005);
	if (abs(y - 352) < 1)
		state = 9;
	break;
	
	case 9:
	if keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) {
		room_goto(Room1)
	}
	break;
}
