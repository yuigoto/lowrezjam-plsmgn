/// @description Update fragment position
var move_x = lengthdir_x(frag_spd, frag_dir), 
    move_y = lengthdir_y(frag_spd, frag_dir);

if (image_xscale > .5) {
    if (global.PLAYER != noone) {
        if (place_meeting(x, y, global.PLAYER)) {
            global.PLAYER.gun_damage -= 2;
            for (var i = 0; i < 8; i++) {
                instance_create_depth(x, y, depth, obj_explosionBits);
            }
            audio_play_sound(snd_hit, 0, 0);
            instance_destroy();
        }
    } else {
        if (place_meeting(x, y, obj_player)) {
            with (obj_player) {
                gun_damage -= 2;
            }
            for (var i = 0; i < 8; i++) {
                instance_create_depth(x, y, depth, obj_explosionBits);
            }
            audio_play_sound(snd_hit, 0, 0);
            instance_destroy();
        }
    }
}

x += (place_meeting(x + move_x, y, obj_parentWall)) ? move_x * -1 : move_x;
y += (place_meeting(x, y + move_y, obj_parentWall)) ? move_y * -1 : move_y;
