/// @description Update depth
depth = -y;

// Reduce life
shot_life -= 1;
if (shot_life == 0) {
    for (var i = 0; i < 4; i++) {
        instance_create_depth(x, y, depth, obj_plasmaBitsBots);
    }
    instance_destroy();
}