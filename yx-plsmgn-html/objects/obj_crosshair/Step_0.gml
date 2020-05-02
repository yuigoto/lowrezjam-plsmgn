/// @description Always follow the mouse
x = mouse_x;
y = mouse_y;

// If using gamepad, follow the right analog
if (abs(gamepad_axis_value(0,gp_axisrh)) > .3 || abs(gamepad_axis_value(0,gp_axisrv)) > .3) {
    if (global.PLAYER != noone) {
        x = global.PLAYER.x;
        y = global.PLAYER.y;
    }
    var dirs = point_direction(x, y, x + gamepad_axis_value(0, gp_axisrh), y + gamepad_axis_value(0, gp_axisrv));
    var leng = point_distance(x, y, x + 24 * gamepad_axis_value(0, gp_axisrh), y + 24 * gamepad_axis_value(0, gp_axisrv));
    x += lengthdir_x(leng,dirs);
    y += lengthdir_y(leng,dirs);
}
