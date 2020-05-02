/// @description Hit by a bot plasma shot
with (other) {
    audio_play_sound(snd_shotWall, 0, 0);
    for (var i = 0; i < 8; i++) {
        instance_create_depth(x, y, depth - 1, obj_plasmaBitsBots);
    }
    instance_destroy();
}

// Shake camera
if (global.CAMERA != noone) {
    global.CAMERA.camera_shake = 1;
}

// Deal damage to the gun
gun_damage -= 2;
