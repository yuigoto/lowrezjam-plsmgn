/// @description Updates player position, based on subpixel speed
if (global.GAME_PASS == false) {
    // Movement variable
    var new_x, new_y, move_dirs, move_dist, move_x, move_y, face_dirs;

    sub_x += spd_x;
    sub_y += spd_y;
    new_x = round(sub_x);
    new_y = round(sub_y);
    sub_x -= new_x;
    sub_y -= new_y;

    // Define distance and direction to move
    move_dirs = point_direction(0, 0, new_x, new_y);
    move_dist = clamp(point_distance(0, 0, new_x, new_y), 0, spd_max);
    if (move_dist != 0 && dash_spd > 0) move_dist += dash_spd;

    // Check for collisions
    move_x = lengthdir_x(move_dist, move_dirs);
    move_y = lengthdir_y(move_dist, move_dirs);

    // Change movement of the sprite
    if (new_x != 0 || new_y != 0) {
        image_speed = 1;
    } else {
        image_speed = 0;
        image_index = 0;
    }

    // Update position
    if (spd_max > 1 || move_dist > 1) {
        repeat(abs(move_x)) {
            if (!place_meeting(x + sign(move_x), y, obj_parentWall)) {
                x += sign(move_x);
            } else {
                move_x = 0;
                break;
            }
        }

        repeat(abs(move_y)) {
            if (!place_meeting(x, y + sign(move_y), obj_parentWall)) {
                y += sign(move_y);
            } else {
                move_y = 0;
                break;
            }
        }
    } else {
        if (!place_meeting(x + sign(move_x), y, obj_parentWall)) {
            x += sign(move_x);
        } else {
            move_x = 0;
        }
    
        if (!place_meeting(x, y + sign(move_y), obj_parentWall)) {
            y += sign(move_y);
        } else {
            move_y = 0;
        }
    }

    // Change depth
    if (new_y != 0) depth = -y;

    // Clamp position
    x = clamp(x, abs(sprite_width) / 2, room_width - (abs(sprite_width) / 2));
    y = clamp(y, abs(sprite_height) / 2, room_height - (abs(sprite_height) / 2));

    // Set facing direction
    face_dirs = point_direction(x, y, mouse_x, mouse_y);

    // If player is using controller, check right analog
    gamepad_set_axis_deadzone(0, .2);
    if (
        abs(gamepad_axis_value(0,gp_axislh)) > .3 || abs(gamepad_axis_value(0,gp_axislv)) > .3
        || abs(gamepad_axis_value(0,gp_axisrh)) > .3 || abs(gamepad_axis_value(0,gp_axisrv)) > .3
    ) {
        face_dirs = point_direction(x, y, x + gamepad_axis_value(0, gp_axisrh), y + gamepad_axis_value(0, gp_axisrv));
    }


    // Gun position
    gun.y = y + gun_y;

    // Set gun direction
    gun.direction = face_dirs;
    gun.image_angle = gun.direction;

    // Set facing and x/y scale
    if (face_dirs >= 90 && face_dirs < 270) {
        image_xscale = -1;
        gun.x = x + gun_x;
        gun.image_yscale = -1;
    } else {
        gun.x = x - gun_x;
        image_xscale = 1;
        gun.image_yscale = 1;    
    }

    // Changing depth
    if (face_dirs < 180) {
        gun.depth = depth + 1;
    } else {
        gun.depth = depth - 1;
    }
}