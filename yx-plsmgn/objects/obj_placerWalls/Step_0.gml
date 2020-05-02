/// @description DescriptionGoesHere

// Variables
var _fx, _fy;
_fx = 0;
_fy = 0;

// Check for single empty floors
while (_fy <= final_ypos + 16) {
    // Store the target ID
    test = place_meeting(_fx, _fy, obj_parentFloor);

    // Does it collide with the floor?
    if (test) {
        // Check all corners for the existence of floors
        var up = place_meeting(_fx, _fy - 8, obj_parentFloor);
        var dn = place_meeting(_fx, _fy + 8, obj_parentFloor);
        var lt = place_meeting(_fx - 8, _fy, obj_parentFloor);
        var rt = place_meeting(_fx + 8, _fy, obj_parentFloor);
        
        if (up && dn && !lt && !rt) {
            if (_fx - 8 > 16) {
                instance_create_depth(
                    _fx - 8, 
                    _fy, 
                    0, 
                    obj_floor
                );
            }
            
            if (_fx + 8 < arena_width + arena_xoffset - 16) {
                instance_create_depth(
                    _fx + 8, 
                    _fy, 
                    0, 
                    obj_floor
                );
            }
        } else if (!up && !dn && lt && rt) {
            if (_fy - 8 > 16) {
                instance_create_depth(
                    _fx, 
                    _fy - 8, 
                    0, 
                    obj_floor
                );
            }
            
            if (_fy + 8 < arena_height + arena_yoffset - 16) {
                instance_create_depth(
                    _fx, 
                    _fy + 8, 
                    0, 
                    obj_floor
                );
            }
        } else if (up + dn + lt + rt > 3) {
            if (
                _fx - 8 > 16
                && _fx + 8 < arena_width + arena_xoffset - 16 
                && _fy - 8 > 16 
                && _fy + 8 < arena_height + arena_yoffset - 16 
            ) {
                instance_create_depth(_fx, _fy, 0, obj_floor);
            }
        }
    }

    if (_fx < start_xpos) x = start_xpos;

    if (_fx == final_xpos) {
        _fy += 8;
        _fx = 0;
    } else {
        _fx += 8;
    }
}

while (y <= final_ypos + 16) {
    // Store the target ID
    target = instance_place(x, y, obj_parentFloor);

    // Does it collide with the floor?
    if (instance_exists(target)) {
        // Check all corners for the existence of floors
        var up = place_meeting(x, y - 8, obj_parentFloor);
        var dn = place_meeting(x, y + 8, obj_parentFloor);
        var lt = place_meeting(x - 8, y, obj_parentFloor);
        var rt = place_meeting(x + 8, y, obj_parentFloor);
    
        // Place wall tiles
        if (!up) instance_create_depth(x, y - 8, 0, obj_wallRise);
        if (!dn) instance_create_depth(x, y + 8, 0, obj_wallRise);
        if (!lt) instance_create_depth(x - 8, y, 0, obj_wallRise);
        if (!rt) instance_create_depth(x + 8, y, 0, obj_wallRise);
        
        var off_x  = (x - arena_xoffset) div CELL_W;
        var off_y  = (y - arena_yoffset) div CELL_H;
        var off_lt = (x - 8 - arena_xoffset) div CELL_W;
        var off_rt = (x + 8 - arena_xoffset) div CELL_W;
        var off_up = (y - 8 - arena_yoffset) div CELL_H;
        var off_dn = (y + 8 - arena_yoffset) div CELL_H;
        
        if (!up) mp_grid_add_cell(global.GEN_PATHGRID, off_x, off_up);
        if (!dn) mp_grid_add_cell(global.GEN_PATHGRID, off_x, off_dn);
        if (!lt) mp_grid_add_cell(global.GEN_PATHGRID, off_lt, off_y);
        if (!rt) mp_grid_add_cell(global.GEN_PATHGRID, off_rt, off_y);
        
        // Place an enemy
        var odds = irandom(5);
        var en_x = x + CELL_W / 2;
        var en_y = y + CELL_H / 2;
            
        if (
            point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 64 
            && odds == 5 
            && global.GAME_ENEMY < global.GAME_ENEMY_MAX 
        ) {
            global.GAME_ENEMY += 1;
            instance_create_depth(en_x, en_y, 0, obj_bots);
        } else if (
            point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 64 
            && odds == 3 
            && global.GAME_ENEMY < global.GAME_ENEMY_MAX 
            && global.GAME_CURR > 10
        ) {
            global.GAME_ENEMY += 1;
            instance_create_depth(en_x, en_y, 0, obj_botsDash);
        } else if (
            point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 64 
            && odds == 0 
            && global.GAME_ENEMY < global.GAME_ENEMY_MAX 
            && global.GAME_CURR > 20
        ) {
            global.GAME_ENEMY += 1;
            instance_create_depth(en_x, en_y, 0, obj_botsExplode);
        }
    }

    if (x < start_xpos) x = start_xpos;

    if (x == final_xpos) {
        y += 8;
        x = 0;
    } else {
        x += 8;
    }
}
    
if (global.GAME_ENEMY < global.GAME_ENEMY_MAX) {
    x = start_xpos;
    y = start_ypos;

    while (y <= final_ypos + 16) {
        // Store the target ID
        target = instance_place(x, y, obj_parentFloor);

        // Does it collide with the floor?
        if (instance_exists(target)) {
            // Place an enemy
            var odds = irandom(5);
            var en_x = x + CELL_W / 2;
            var en_y = y + CELL_H / 2;
            
            if (
                point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 64 
                && odds == 5 
                && global.GAME_ENEMY < global.GAME_ENEMY_MAX 
            ) {
                global.GAME_ENEMY += 1;
                instance_create_depth(en_x, en_y, 0, obj_bots);
            } else if (
                point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 64 
                && odds == 3 
                && global.GAME_ENEMY < global.GAME_ENEMY_MAX 
                && global.GAME_CURR > 10
            ) {
                global.GAME_ENEMY += 1;
                instance_create_depth(en_x, en_y, 0, obj_botsDash);
            } else if (
                point_distance(en_x, en_y, global.GEN_PLAYERX, global.GEN_PLAYERY) > 64 
                && odds == 0 
                && global.GAME_ENEMY < global.GAME_ENEMY_MAX 
                && global.GAME_CURR > 20
            ) {
                global.GAME_ENEMY += 1;
                instance_create_depth(en_x, en_y, 0, obj_botsExplode);
            }
        }

        if (x < start_xpos) x = start_xpos;

        if (x == final_xpos) {
            y += 8;
            x = 0;
        } else {
            x += 8;
        }
    }
}

if (y > final_ypos && global.GAME_ENEMY >= global.GAME_ENEMY_MAX) {
    if (global.PLAYER == noone) {
        global.PLAYER = instance_create_depth(
            global.GEN_PLAYERX + (CELL_W / 2), 
            global.GEN_PLAYERY + (CELL_H / 2), 
            0, 
            obj_player
        );
    } else {
        global.PLAYER.x = global.GEN_PLAYERX + (CELL_W / 2); 
        global.PLAYER.y = global.GEN_PLAYERY + (CELL_H / 2);
    }
    global.CAMERA.camera_follow = global.PLAYER;
    global.CAMERA.x = room_width / 2;
    global.CAMERA.y = 0;
    global.PLAYER.depth = -global.PLAYER.y;
    
    if (global.GAME_PASS == true) global.GAME_PASS = false;
    
    with(obj_wallRise) {
        triggered = true;
    }
    
    with(obj_floor) {
        triggered = true;
    }
    
    instance_destroy();
}

