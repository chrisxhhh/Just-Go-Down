global.P_System = part_system_create_layer(layer, true);

global.Particle1 = part_type_create();

part_type_shape(global.Particle1, pt_shape_explosion);
part_type_size(global.Particle1, 0.2, 0.5, 0, 0.1);
part_type_color3(global.Particle1, c_white, c_orange, c_red);
part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_speed(global.Particle1, 2, 5, -0.10, 0);
part_type_direction(global.Particle1, 0, 359, 0, 20);
part_type_blend(global.Particle1, true);
part_type_life(global.Particle1, 30, 60);

global.Emitter1 = part_emitter_create(global.P_System);


alarm[0] = room_speed * 0.5;



