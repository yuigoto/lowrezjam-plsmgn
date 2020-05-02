/// @description Draw arrow, when there are few enemies
if (global.PLAYER != noone && global.GAME_ENEMY > 0 && global.GAME_ENEMY <= 5) {
    // Get closest enemy
    var en_dis = 0, 
        en_dir = 0;
    
    // Loop
    with (obj_botsParent) {
        if (en_dis != 0 && point_distance(x, y, global.PLAYER.x, global.PLAYER.y) < en_dis) {
            en_dis = point_distance(x, y, global.PLAYER.x, global.PLAYER.y);
            en_dir = point_direction(global.PLAYER.x, global.PLAYER.y, x, y);
        } else {
            en_dis = point_distance(x, y, global.PLAYER.x, global.PLAYER.y);
            en_dir = point_direction(global.PLAYER.x, global.PLAYER.y, x, y);
        }
    }
    
    draw_sprite_ext(
        spr_arrowSpawn, 
        image_index, 
        global.PLAYER.x + lengthdir_x(16, en_dir), 
        global.PLAYER.y + lengthdir_y(16, en_dir), 
        1, 
        1, 
        en_dir, 
        c_white, 
        1
    );


    /*
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
    */
}
