/// @description Plays one of the history sounds
if (
    !audio_is_paused(sfx_history01)
    && !audio_is_paused(sfx_history02) 
    && !audio_is_paused(sfx_history03) 
    && !audio_is_paused(sfx_history04) 
) {
    switch (irandom_range(1,4)) {
        case 1:
            global.SOUND_HISTORY = sfx_history01;
            audio_play_sound(sfx_history01, 0, false);
            break;
        case 2:
            global.SOUND_HISTORY = sfx_history02;
            audio_play_sound(sfx_history02, 0, false);
            break;
        case 3:
            global.SOUND_HISTORY = sfx_history03;
            audio_play_sound(sfx_history03, 0, false);
            break;
        case 4:
            global.SOUND_HISTORY = sfx_history04;
            audio_play_sound(sfx_history04, 0, false);
            break;
    }
}
