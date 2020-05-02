/// @description Move and shoot the player, if within range
event_inherited();

if (is_idle) {
    if(global.PLAYER != noone) {
        var dist = point_distance(x, y, global.PLAYER.x, global.PLAYER.y),
            dirs = point_direction(x, y, global.PLAYER.x, global.PLAYER.y);
            
        if (dist <= 16) {
            // Suicide!
            instance_create_depth(x, y, depth, obj_explosionHuge);
            for (var i = 0; i < 16; i++) {
                instance_create_depth(x, y, depth, obj_explosionBitsHuge);
            }
            instance_destroy();

            // Decrease global enemy count
            if (global.GAME_ENEMY > 0) global.GAME_ENEMY--;
        } else if (dist > 16 && dist <= 48) {
            var rand = irandom(25);
            
            if (rand == 5 && !is_shooting) {
                var shot = instance_create_depth(x, y, depth, obj_plasmaShotBots);
                audio_play_sound(snd_shot, 0, false);
                shot.direction = dirs;
                alarm[0] = 20;
            } else if (rand == 4) {
                is_idle = false;
                is_dashing = true;
                dashing_speed = 2;
                audio_play_sound(snd_dash, 0, false);
            }
        }
    }
}
