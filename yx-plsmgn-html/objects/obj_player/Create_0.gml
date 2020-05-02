/// @description Bootstrap player variables

// Max player speed
spd_max = 1;

// Speed
spd_x = 0;
spd_y = 0;

// Subpixel movement speed
sub_x = 0;
sub_y = 0;

// Player life and ammo
life        = 100;
life_max    = 100;

// Ammo
ammo        = 200;
ammo_max    = 200;

// Multiplier for accel, decel factors
fact_ratio      = 1;

// Acceleration, deceleration, etc.
fact_accel		= 0.10 * fact_ratio;
fact_decel      = 0.20 * fact_ratio;
fact_dash       = 0.03 * fact_ratio;

// Direction the player is facing
facing_dir      = 0;

// Dashing
dash_status = false;
dash_spd    = 0;
dash_max    = 3;

// Gun handler and offset
gun_x       = -1;
gun_y       = 1;
gun         = instance_create_depth(
    x + gun_x, 
    y + gun_y, 
    0, 
    obj_plasmaGun 
);

// Gun timer and status
gun_firing      = false;
gun_fired       = 0;

// Gun damage
gun_damage      = 200;
gun_damage_max  = 200;
gun_leak        = 30;
gun_leaking     = false;
