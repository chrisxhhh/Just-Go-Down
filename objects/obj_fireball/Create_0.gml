/// @description Insert description here
// You can write your code in this editor



speed = random_range(5, 8);
direction = point_direction(x, y, obj_player.x, obj_player.y);
image_angle = direction;
dmg = 15;

speed *= (1 + obj_map.current_level * 0.05)
dmg *= (1 + obj_map.current_level * 0.05)

