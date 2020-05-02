/// @description Reset cursor and delete objects

// Delete and reset player
if (global.PLAYER != noone) {
    instance_destroy(global.PLAYER);
    global.PLAYER = noone;
}

if (global.CROSSHAIR != noone) {
    instance_destroy(global.CROSSHAIR);
    global.CROSSHAIR = noone;
    window_set_cursor(cr_default);
}

// Delete camera
if (global.CAMERA != noone) {
    instance_destroy(global.CAMERA);
    global.CAMERA = noone;
    global.CAMERA_GENERIC = noone;
}
