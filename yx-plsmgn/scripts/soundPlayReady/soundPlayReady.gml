/// @description Plays one of the history sounds
if (
    !audio_is_paused(sfx_ready01)
    && !audio_is_paused(sfx_ready02) 
    && !audio_is_paused(sfx_ready03) 
    && !audio_is_paused(sfx_ready04) 
    && !audio_is_paused(sfx_ready05) 
    && !audio_is_paused(sfx_ready06) 
    && !audio_is_paused(sfx_ready07) 
) {
    switch (irandom_range(1,7)) {
        case 1:
            audio_play_sound(sfx_ready01, 0, false);
            break;
        case 2:
            audio_play_sound(sfx_ready02, 0, false);
            break;
        case 3:
            audio_play_sound(sfx_ready03, 0, false);
            break;
        case 4:
            audio_play_sound(sfx_ready04, 0, false);
            break;
        case 5:
            audio_play_sound(sfx_ready05, 0, false);
            break;
        case 6:
            audio_play_sound(sfx_ready06, 0, false);
            break;
        case 7:
            audio_play_sound(sfx_ready07, 0, false);
            break;
    }
}
