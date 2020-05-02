/// @description Delete all walls
with (obj_wall) {
    instance_create_depth(x, y, depth, obj_wallFall);
    instance_destroy();
}
