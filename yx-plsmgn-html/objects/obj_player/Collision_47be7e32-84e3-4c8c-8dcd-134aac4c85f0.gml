/// @description Reduce gun damage
with (other) {
    audio_play_sound(snd_explode, 0, 0);
    instance_create_depth(x, y, depth - 1, obj_explosion);
    for (var i = 0; i < 16; i++) {
        instance_create_depth(x, y, depth - 1, obj_explosionBits);
    }
    instance_destroy();
}

// Shake camera
if (global.CAMERA != noone) {
    global.CAMERA.camera_shake = 6;
}

// Deal damage to the gun
gun_damage -= 10;

// Decrease global enemy count
if (global.GAME_ENEMY > 0) global.GAME_ENEMY--;
