/// @description Checks for keypresses
if (global.MUSIC != noone && audio_is_playing(global.MUSIC) && audio_sound_get_track_position(global.MUSIC) >= 53.35) {
    audio_sound_set_track_position(global.MUSIC, 10.73);
}

// Start button
if (action1Pressed() || mouse_check_button_pressed(mb_left)) {
    room_goto_next();
}
