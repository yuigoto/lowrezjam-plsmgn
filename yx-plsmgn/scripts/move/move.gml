/// move(hspd, vspd)
var hspd = argument[0];
var vspd = argument[1];

var face = point_direction(x, y, x + hspd, y + vspd);
var dist = point_distance(x, y, x + hspd, y + vspd);

// H collisions
if (hspd != 0) {
    repeat(abs(hspd)) {
        if (!place_meeting(x + sign(hspd), y, obj_parentWall)) {
            x += sign(hspd);
        }
    }
}

// V collisions
if (vspd != 0) {
    repeat(abs(vspd)) {
        if (!place_meeting(x, y + sign(vspd), obj_parentWall)) {
            y += sign(vspd);
        }
    }
}