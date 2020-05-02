/// @description Bootstrap enemy entity data

// Set depth
depth = -y;

// Enemy is facing which direction?
is_facing = choose(0, 90, 180, 270);

// Define enemy speed
enemy_speed = 1;

// Is robot idle?
is_idle = true;

// Are we shooting?
is_shooting = false;

// Is robot dashing?
is_dashing = false;

// Path
path = noone;

// Dashing speed, timer and decel factor
dashing_speed = 0;
dashing_decel = 0.007;
dashing_timer = 0;
