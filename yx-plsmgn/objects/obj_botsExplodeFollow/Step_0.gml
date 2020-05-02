/// @description Move and shoot the player, if within range
event_inherited();

if (is_idle) {
    if(global.PLAYER != noone) {
        var dist = point_distance(x, y, global.PLAYER.x, global.PLAYER.y),
            dirs = point_direction(x, y, global.PLAYER.x, global.PLAYER.y);
    
        if (dist <= 32) {
            var shot = instance_create_depth(x, y, depth, obj_plasmaShotBots);
            shot.direction = dirs;
        }
    } else {
        if (instance_number(obj_player) > 0) {
            var dist = point_distance(x, y, obj_player.x, obj_player.y),
                dirs = point_direction(x, y, obj_player.x, obj_player.y);
    
            
            if (dist <= 16) {
                // Suicide!
                instance_create_depth(x, y, depth, obj_explosionHuge);
                for (var i = 0; i < 16; i++) {
                    instance_create_depth(x, y, depth, obj_explosionBitsHuge);
                }
                instance_destroy();
            } else if (dist > 16 && dist <= 48) {
                var rand = irandom(25);
                
                if (rand == 25 && !is_shooting) {
                    var shot = instance_create_depth(x, y, depth, obj_plasmaShotBots);
                    audio_play_sound(snd_shot, 0, false);
                    shot.direction = dirs;
                    alarm[0] = 20;
                } else if (rand == 24) {
                    is_idle = false;
                    is_dashing = true;
                    dashing_speed = 2;
                    audio_play_sound(snd_dash, 0, false);
                }
            }
        }
    }
}
