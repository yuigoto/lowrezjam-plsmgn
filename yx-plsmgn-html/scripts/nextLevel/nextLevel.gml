global.CAMERA.camera_follow = global.CAMERA_GENERIC;

// Delete grid
mp_grid_destroy(global.GEN_PATHGRID);

// Remove player from screen
global.PLAYER.x = -1000;
global.PLAYER.y = -1000;

// Delete entities
with (obj_botsParent) {
    instance_destroy();
}

with (obj_wall) {
    instance_create_depth(x, y, depth, obj_wallFall);
    instance_destroy();
}

with (obj_floor) {
    instance_create_depth(x, y, depth, obj_floorReverse);
    instance_destroy();
}

with (obj_canister) {
    instance_destroy();
}

with (obj_canisterRed) {
    instance_destroy();
}
