/// @description Plays one of the history sounds
if (
    !audio_is_paused(sfx_go01)
    && !audio_is_paused(sfx_go02) 
    && !audio_is_paused(sfx_go03) 
) {
    switch (irandom_range(1,3)) {
        case 1:
            audio_play_sound(sfx_go01, 0, false);
            break;
        case 2:
            audio_play_sound(sfx_go02, 0, false);
            break;
        case 3:
            audio_play_sound(sfx_go03, 0, false);
            break;
    }
}
