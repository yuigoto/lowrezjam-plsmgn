/// @description Move the shot

var move_x = lengthdir_x(shot_spd, direction), 
    move_y = lengthdir_y(shot_spd, direction);

repeat(abs(move_x)) {
    if (
        !place_meeting(x + sign(move_x), y, obj_parentWall) 
    ) {
        x += sign(move_x);
    }
}

repeat(abs(move_y)) {
    if (!place_meeting(x, y + sign(move_x), obj_parentWall)
    ) {
        y += sign(move_y);
    }
}

if (
    (move_x != 0 || move_y != 0) 
    && place_meeting(x + move_x, y + move_y, obj_parentWall)
) {
    audio_play_sound(snd_hit, 0, 0);
    for (var i = 0; i < 4; i++) {
        instance_create_depth(x, y, depth - 1, obj_plasmaParticleBots);
    }
    instance_destroy();
}
