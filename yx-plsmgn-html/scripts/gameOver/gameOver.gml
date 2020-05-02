if (global.PLAYER != noone) {
    with (global.PLAYER) {
        instance_destroy();
        global.PLAYER = noone;
    }
    
    global.CAMERA.camera_follow = global.CAMERA_GENERIC;
    
    // Delete grid
    mp_grid_destroy(global.GEN_PATHGRID);
    
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
    
    soundPlayTooBad();
}