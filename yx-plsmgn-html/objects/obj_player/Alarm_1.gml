/// @description The gun is leaking!
gun_leaking = false;
ammo -= 1;
instance_create_depth(
    x, 
    y, 
    depth - 1, 
    obj_plasmaDrop 
);
