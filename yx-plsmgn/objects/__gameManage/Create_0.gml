/// @description Bootstrap the game's parameters

// Reset all variables
__bootVars();

// Messages surface
messages = noone;

if (audio_is_playing(ost_titleScreen)) {
    audio_stop_sound(ost_titleScreen);
}

if (global.MUSIC != noone) {
    audio_stop_sound(global.MUSIC);
    global.MUSIC = noone;
}

// Create a commander (generic camera follow object)
global.CAMERA_GENERIC = instance_create_depth(180, 48, 0, obj_commandRoom);

// Create a camera and set to follow the command room
global.CAMERA = instance_create_depth(0, 0, 0, obj_camera);
global.CAMERA.camera_follow = global.CAMERA_GENERIC;

// Check if it's first time playing
global.GEN_FIRST_TIME = firstTimePlay();

// Create HUD
global.HUD = instance_create_depth(0, 0, -9998, obj_hud);

// Start history and music
soundPlayHistory();
global.MUSIC = audio_play_sound(ost_mainTheme, 0, false);
// 264.05
