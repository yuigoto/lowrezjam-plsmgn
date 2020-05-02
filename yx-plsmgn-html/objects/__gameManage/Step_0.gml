/// @description Updates the game state
if (global.GAME_BUILD == true) {
    if (action1Pressed() || mouse_check_button_pressed(mb_left)) {
        room_goto(rm_titleScreen);
    }
}

// Fade song
if (global.GAME_OVER) {
    if (audio_is_playing(global.MUSIC)) {
        if (audio_sound_get_gain(global.MUSIC) > 0) {
            audio_sound_gain(global.MUSIC, 0, 300);
        } else {
            audio_stop_sound(global.MUSIC);
        }
    }
}

if (global.MUSIC != noone && audio_is_playing(global.MUSIC) && audio_sound_get_track_position(global.MUSIC) >= 264) {
    audio_sound_set_track_position(global.MUSIC, 36);
}

// Is the game over?
if (global.GAME_OVER == true && global.GAME_END == false) {
    global.GAME_END = true;
    // Game Status: Game Over
    alarm[3] = 30;
} else {
    // Game Status: Running
    if (global.GAME_MID && global.PLAYER != noone) {
        if (global.PLAYER.ammo == 0) {
            global.GAME_OVER = true;
            
            // Game Over!
            gameOver();
        }
        
        if (global.GAME_ENEMY == 0 && global.GAME_PASS == false) {
            // Prepare things for next level
            nextLevel();
            
            // Set enemy to -1
            global.GAME_ENEMY = -1;
            
            // Passed
            global.GAME_PASS = true;
            global.GAME_ENEMY = 0;
            
            // Next Level
            global.GAME_CURR += 1;
            
            if (global.GAME_CURR % 10 == 0) {
                global.GAME_ENEMY_MAX += 5;
                global.GEN_STEPS += 20;
                global.GEN_TILES += 20;
            } else if (global.GAME_CURR % 5 == 0) {
                global.GAME_ENEMY_MAX += 2;
                global.GEN_STEPS += 5;
                global.GEN_TILES += 5;
            }
            
            if (global.GAME_CURR > 100) {
                // Game over if level 100
                global.GAME_OVER = true;
            } else {
                // Play good job!
                soundPlayGoodJob();
                
                // Go to next level
                alarm[2] = room_speed * 2;
            }
        }

    }

    // Game Status: Started
    if (global.GAME_INI && !global.GAME_MID) {
        // Set the game to run
        instance_create_depth(0, 0, 0, obj_placerFloor);
        
        // Started!
        global.GAME_MID = true;
    }

    // Game Status: Boot
    if (!global.GAME_INI) {
        if (global.GAME_READY && !global.GAME_GO) {
            global.GAME_GO = true;
            soundPlayReady();
            alarm[0] = room_speed * 2;
        } else {
            if (!global.GEN_FIRST_TIME && (action1Pressed() || mouse_check_button_pressed(mb_left))) {
                audio_stop_sound(global.SOUND_HISTORY);
                global.SOUND_HISTORY = noone;
                global.GAME_READY = true;
            } else {
                if (!audio_is_playing(global.SOUND_HISTORY)) {
                    global.GAME_READY = true;
                }
            }
        }
    }
}
