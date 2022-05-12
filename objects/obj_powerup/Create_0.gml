/// @description Insert description here
// You can write your code in this editor
checkpt = noone;
bro = noone;

powerup = irandom(6);


// [ hp+, exp+, gem+, gold+, slime+, explostion, freeze ]

switch powerup {
	
	case 0:
	sprite_index = spr_hp;
	break;
	
	case 1:
	sprite_index = spr_exp;
	image_xscale = 2;
	image_yscale = 2;
	break;
	
	case 2:
	sprite_index = spri_gem;
	image_xscale = 1.5;
	image_yscale = 1.5;
	break;
	
	case 3:
	sprite_index = spri_gold;
	image_xscale = 1.5;
	image_yscale = 1.5;
	break;
	
	case 4:
	sprite_index = spr_slime_bullet;
	break;
	
	case 5:
	sprite_index = spr_explosion;
	break;
	
	case 6:
	sprite_index = spr_freeze;
	break;
	
}

image_xscale *= 2;
image_yscale *= 2;
