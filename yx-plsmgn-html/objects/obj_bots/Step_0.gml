/// @description Move and shoot the player, if within range
event_inherited();

if (is_idle) {
    if(global.PLAYER != noone) {
        var dist = point_distance(x, y, global.PLAYER.x, global.PLAYER.y),
            dirs = point_direction(x, y, global.PLAYER.x, global.PLAYER.y), 
            obst = collision_line(x, y, global.PLAYER.x, global.PLAYER.y, obj_parentWall, false, true);

        if (dist <= 48) {
            var rand = irandom(25);
            
            if (rand == 25 && !obst && !is_shooting) {
                is_shooting = true;
                var shot = instance_create_depth(x, y, depth, obj_plasmaShotBots);
                audio_play_sound(snd_shot, 0, false);
                shot.direction = dirs;
                alarm[0] = 30;
            }
        }
    }
}
