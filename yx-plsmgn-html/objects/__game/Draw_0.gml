/// @description Draw arrow
if (global.PLAYER != noone && instance_number(obj_spawner) > 0) {
    var dir = point_direction(global.PLAYER.x, global.PLAYER.y, obj_spawner.x, obj_spawner.y);
    var dis = point_distance(global.PLAYER.x, global.PLAYER.y, obj_spawner.x, obj_spawner.y);
    
    if (dis > 32) {
        draw_sprite_ext(
            spr_arrowSpawn, 
            image_index, 
            global.PLAYER.x + lengthdir_x(16, dir), 
            global.PLAYER.y + lengthdir_y(16, dir), 
            1, 
            1, 
            dir, 
            c_white, 
            1
        );
    }
}

