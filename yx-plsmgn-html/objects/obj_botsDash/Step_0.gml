/// @description Move and shoot the player, if within range
event_inherited();

if (is_idle) {
    if(global.PLAYER != noone) {
        var dist = point_distance(x, y, global.PLAYER.x, global.PLAYER.y),
            dirs = point_direction(x, y, global.PLAYER.x, global.PLAYER.y), 
            obst = collision_line(x, y, global.PLAYER.x, global.PLAYER.y, obj_parentWall, false, true);
            
        if (dist <= 48) {
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
