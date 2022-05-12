



power_left = instance_create_depth(x - 125, y, -6000, obj_powerup);
power_left.checkpt = id;


power_right = instance_create_depth(x + 125, y, -6000, obj_powerup);
power_right.checkpt = id;


power_left.bro = power_right;

power_right.bro = power_left;
