/// @description Bootstrap game

// Set HUD surface
srfc = noone; 

if (!audio_is_playing(ost_mainTheme)) {
    audio_play_sound(ost_mainTheme, 0, 0);
}

// Create player and crosshair
if (global.PLAYER == noone) {
    instance_create_depth(room_width / 2, room_height / 2, 0, obj_spawner);
    global.PLAYER = instance_create_depth(room_width / 2 + 4, room_height / 2 + 4, -1, obj_player);
}

if (global.CROSSHAIR == noone) {
    window_set_cursor(cr_none);
    global.CROSSHAIR = instance_create_depth(room_width / 2, room_height / 2, 0, obj_crosshair);
}

// Create camera and set following
if (global.CAMERA == noone) {
    global.CAMERA = instance_create_depth(0, 0, 0, obj_camera);
    global.CAMERA.camera_follow = global.PLAYER;
}
