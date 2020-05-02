/// @description Plays one of the history sounds
if (
    !audio_is_paused(sfx_goodjob01)
    && !audio_is_paused(sfx_goodjob02) 
    && !audio_is_paused(sfx_goodjob03) 
    && !audio_is_paused(sfx_goodjob04) 
    && !audio_is_paused(sfx_goodjob05) 
    && !audio_is_paused(sfx_goodjob06) 
    && !audio_is_paused(sfx_goodjob07) 
    && !audio_is_paused(sfx_goodjob08) 
    && !audio_is_paused(sfx_goodjob09) 
    && !audio_is_paused(sfx_goodjob10) 
    && !audio_is_paused(sfx_goodjob11) 
    && !audio_is_paused(sfx_goodjob12) 
    && !audio_is_paused(sfx_goodjob13) 
    && !audio_is_paused(sfx_goodjob14) 
) {
    switch (irandom_range(1,3)) {
        case 1: audio_play_sound(sfx_goodjob01, 0, false); break;
        case 2: audio_play_sound(sfx_goodjob02, 0, false); break;
        case 3: audio_play_sound(sfx_goodjob03, 0, false); break;
        case 4: audio_play_sound(sfx_goodjob04, 0, false); break;
        case 5: audio_play_sound(sfx_goodjob05, 0, false); break;
        case 6: audio_play_sound(sfx_goodjob06, 0, false); break;
        case 7: audio_play_sound(sfx_goodjob07, 0, false); break;
        case 8: audio_play_sound(sfx_goodjob08, 0, false); break;
        case 9: audio_play_sound(sfx_goodjob09, 0, false); break;
        case 10: audio_play_sound(sfx_goodjob10, 0, false); break;
        case 11: audio_play_sound(sfx_goodjob11, 0, false); break;
        case 12: audio_play_sound(sfx_goodjob12, 0, false); break;
        case 13: audio_play_sound(sfx_goodjob13, 0, false); break;
        case 14: audio_play_sound(sfx_goodjob14, 0, false); break;
    }
}
