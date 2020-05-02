/// @description Align and bootstrap title screen

// Update y
y = 12;
depth = -1000;

if (audio_is_playing(ost_mainTheme)) {
    audio_stop_sound(ost_mainTheme);
}

if (global.MUSIC != noone) {
    audio_stop_sound(global.MUSIC);
    global.MUSIC = noone;
}

global.MUSIC = audio_play_sound(ost_titleScreen, 0, false);
