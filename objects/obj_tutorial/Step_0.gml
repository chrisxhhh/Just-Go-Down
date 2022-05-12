
player_x = obj_player.x
player_y = obj_player.y

if player_y > 2400 and not switchyet {
	word = "switch"	
	switchyet = true
}




switch (word) {
	case "movement":
		if keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("W")){
			word = "notyet"	
		}
		break;
	case "go":
		break;
	case "switch":
		if keyboard_check(ord("1")) or keyboard_check(ord("2")) or keyboard_check(ord("3")){
			word = "use"		
		}
		break;
	case "use":
		if (mouse_check_button(mb_left) and obj_player.weapon != 0){
			word = "done"	
		}
		break;
	case "notyet":
		break;
	case "done":
		instance_destroy(self)
}	

