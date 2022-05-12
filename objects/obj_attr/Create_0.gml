globalvar pause;
global.pause = false;

levelup = false;
level_points = 50;

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
stat_name = [ "STRENGTH", "DEXTERITY", "INTELLIGENCE", "VATALITY", "DEFENSE", "RESISTANCE", "SPIRIT", "BLACKSMITH" ];
stat_indicator = [ 1, 1, 1, 1, 1, 1, 1, 1 ];

len_attr = 10
attr_name = [ "HP", "movement", "attack", "attack speed", "dig speed", "damage resistance", "view", "learning", "storm resistance", "efficiency" ]
attr_indicator = [ player_hp_max, 1, 1, 1, 1, 1, 1, 1, 1, 1 ];

stat_map = [
	//"HP", "movement", "attack", "attack speed", "dig speed", "damage resistance", "view", "learning", "storm resistance", "efficiency"
	[10, 2 , 10, 0 , 10, 0 , 0 , 0 , 0 , 0 ], // STR
	[0 , 5 , 0 , 2 , 5 , 0 , 0 , 0 , 0 , 0 ], // DEX
	[0 , 0 , 0 , 5 , 0 , 0 , 1 , 5 , 0 , 5 ], // INT
	[30, 0 , 0 , 0 , 0 , 0 , 0 , 0 , 3 , 0 ], // VAL
	[10, 0 , 0 , 0 , 0 , 10, 0 , 0 , 0 , 0 ], // DEF
	[0 , 0 , 0 , 0 , 0 , 5 , 0 , 0 , 10, 0 ], // RES
	[5 , 2 , 2 , 1 , 1 , 2 , 1 , 10, 5 , 2 ], // SPR
	[0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 10]  // BLK
]



//num_gold	= 0;
//num_gem		= 0;

mask_dur_max = 5;
mask_dur	 = mask_dur_max;

in_storm	= false;
mask_base	= 3 * room_speed;
mask_cd		= mask_base;

