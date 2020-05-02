/// @description Fires a plasma shot

// Gets gun direction and shot position
if (ammo > 0) {
    var offset = gun.off_dirs * gun.off_mods,
        shot = instance_create_depth(
        gun.x + lengthdir_x(gun.off_dist, gun.direction + offset), 
        gun.y + lengthdir_y(gun.off_dist, gun.direction + offset),
        0, 
        obj_plasmaShot
    );
    audio_play_sound(snd_shot, 0, 0);
    shot.direction = gun.direction;
    gun_fired += 1;
    if (gun_fired % 10 == 0) gun_damage -= 2;
    ammo -= 1;
}

// Set firing to false
gun_firing = false;
