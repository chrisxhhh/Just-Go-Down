/// @description Insert description here
// You can write your code in this editor


var _r = irandom(10 * obj_attr.attr_indicator[7]);
for (var _i = 0; _i < _r; ++_i) {
	var _dir = point_direction(obj_player.x, obj_player.y, x, y);
	var _new_coin = instance_create_depth(x, y, -3000, obj_exp);
	_new_coin.direction = random_range(_dir - 60, _dir + 60);
	_new_coin.speed = random_range(4, 7);
	_new_coin.gravity = random_range(0.3, 0.5);
}

