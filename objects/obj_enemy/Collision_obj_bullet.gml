/// @description Insert description here
// You can write your code in this editor
hp -= 5 * obj_attr.player_atk_mul;
instance_destroy(other);
audio_play_sound(sound_hit, 0, false);
