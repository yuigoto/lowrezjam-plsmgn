/// @description Avoid wall collisions
event_inherited();

if (is_dashing) {
    if (global.PLAYER != noone) {
        var dash_dir = point_direction(x, y, global.PLAYER.x, global.PLAYER.y);
        var dash_dis = point_distance(x, y, global.PLAYER.x, global.PLAYER.y);
    } else {
        var dash_dir = point_direction(x, y, obj_player.x, obj_player.y);
        var dash_dis = point_distance(x, y, obj_player.x, obj_player.y);
    }
    
    var spd_x = lengthdir_x(dashing_speed, dash_dir);
    var spd_y = lengthdir_y(dashing_speed, dash_dir);
    
    if (dashing_speed > 0) {
        repeat(abs(spd_x)) {
            if (!place_meeting(x + sign(spd_x), y, obj_parentWall)) {
                x += sign(spd_x);
            }
        }
        
        repeat(abs(spd_y)) {
            if (!place_meeting(x, y + sign(spd_y), obj_parentWall)) {
                y += sign(spd_y);
            }
        }
    }
    
    if (dash_dis < 16) {
        // Suicide!
        instance_create_depth(x, y, depth, obj_explosionHuge);
        for (var i = 0; i < 16; i++) {
            instance_create_depth(x, y, depth, obj_explosionBitsHuge);
        }
        instance_destroy();

        // Decrease global enemy count
        if (global.GAME_ENEMY > 0) global.GAME_ENEMY--;
    }
    
    dashing_speed = approach(dashing_speed, 0, dashing_decel);
    
    if (dashing_speed <= 0) {
        is_idle = true;
        is_dashing = false;
        dashing_timer = 0;
    } else {
        if (dashing_timer == 0) {
            dashing_timer = 4;
            instance_create_depth(x, y, depth + 1, obj_dust);
        } else {
            dashing_timer --;
        }
    }
} else {
    var new_x = 0;
    var new_y = 0;
    if (is_facing == 180)   new_x = -enemy_speed;
    if (is_facing == 0)     new_x = enemy_speed;
    if (is_facing == 270)   new_y = enemy_speed;
    if (is_facing == 90)    new_y = -enemy_speed;

    if (new_x != 0 || new_y != 0) {
        if (!place_meeting(x + new_x, y + new_y, obj_parentWall)) {
            repeat(abs(new_x)) {
                x += sign(new_x);
            }
        
            repeat(abs(new_y)) {
                y += sign(new_y);
            }
        } else {
            is_facing = choose(0, 90, 180, 270);
        }
    }
}
