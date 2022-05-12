globalvar pause;
global.pause = false;

levelup = false;
level_points = 3;

center_x = 0;
center_y = 0;

player_hp_max	= 200;
player_hp		= player_hp_max;
player_level	= 1;
player_exp		= 0;


level_req		= [0, 10, 25, 40, 60, 80, 100, 125, 150, 175, 200, 250, 300, 350, 400, 450, 500,
				   600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2500, 3000, 3500, 5000];

//level up [max_hp+, move+, atk+, atk_spd+, luck+, camera+]


len_stat = 8;
stat_name = [ "STRENGTH", "DEXTERITY", "INTELLIGENCE", "VATALITY", "DEFENSE", "RESISTANCE", "SPIRIT", "BLACKSMITH(5)" ];
stat_indicator = [ 1, 1, 1, 1, 1, 1, 1, 1 ];

len_attr = 10
attr_name = [ "HP", "movement", "attack", "attack speed", "dig speed", "damage resistance", "dodge chance", "learning", "storm resistance", "efficiency" ]
attr_indicator = [ player_hp_max, 1, 1, 1, 1, 1, 1, 1, 1, 1 ];


player_luck		= 1;
player_move_mul = 1;
player_atk_mul	= 1;
player_atk_spd	= 1;
camera_mul		= 1;

level_indicator = [1, 1, 1, 1, 1, 1];

num_gold	= 0;
num_gem		= 0;

mask_dur_max = 5;
mask_dur	 = mask_dur_max;

in_storm	= false;
mask_cd		= 3 * room_speed;

