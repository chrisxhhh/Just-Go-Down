

// Inherit the parent event
event_inherited();



hp = 15;

hp *= (1 + obj_map.current_level * 0.2);

xdist_to_player = x - obj_player.x
ydist_to_player = y - obj_player.y

grav_amt = 0
x_spd = 0
x_spd_max = 1
y_spd = 0


my_health_max = 5
my_health = my_health_max
dmg = 10



dir = irandom_range(-1,1)
distance = 0
distance_covered = 0
time_to_decide = true

//timer
just_attack = false

action = "idle"

idle_sprite = spr_wolf_idle
walk_sprite = spr_wolf_move
attack_sprite = spr_wolf_attack

TlayerID = layer_get_id("Tiles_Ground"); 
tilemapID = layer_tilemap_get_id(TlayerID);
empty_tile = 0
