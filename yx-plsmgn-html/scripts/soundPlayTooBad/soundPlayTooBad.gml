/// @description Plays one of the history sounds
if (
    !audio_is_paused(sfx_toobad01)
     && !audio_is_paused(sfx_toobad02)
     && !audio_is_paused(sfx_toobad03)
     && !audio_is_paused(sfx_toobad04)
     && !audio_is_paused(sfx_toobad05)
) {
    switch (irandom_range(1,3)) {
        case 1: audio_play_sound(sfx_toobad01, 0, false); break;
        case 2: audio_play_sound(sfx_toobad02, 0, false); break;
        case 3: audio_play_sound(sfx_toobad03, 0, false); break;
        case 4: audio_play_sound(sfx_toobad04, 0, false); break;
        case 5: audio_play_sound(sfx_toobad05, 0, false); break;
    }
}
