/// @description Destroy
with(other) instance_destroy();

audio_play_sound(snd_explode, 0, 0);

for (var i = 0; i < 8; i++) {
    instance_create_depth(x, y, depth - 1, obj_plasmaParticle);
}

// Decrease global enemy count
if (global.GAME_ENEMY > 0) global.GAME_ENEMY--;

// Shake camera
if (global.CAMERA != noone) {
    global.CAMERA.camera_shake = 3;
}

if (choose(0, 0, 0, 1) == 1) {
    instance_create_depth(x, y, depth, obj_canisterRed);
} else {
    instance_create_depth(x, y, depth, obj_canister);
}
for (var i = 0; i < 8; i++) {
    instance_create_depth(x, y, depth - 2, obj_explosionBits);
}
instance_create_depth(x, y, depth - 3, obj_explosion);
instance_destroy();
