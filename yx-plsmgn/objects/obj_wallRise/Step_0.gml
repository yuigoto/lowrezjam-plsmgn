/// @description Remove, when animation ends, and add wall in place
// Update image speed when triggered
if (triggered && !finished && image_speed == 0) image_speed = random_range(0.1, 0.3);

// If the image is the last frame, stop
if (triggered && !finished && image_index > 1) {
    finished = true;
}

if (image_index >= image_number - 1) {
    instance_create_depth(x, y, depth, obj_wall);
    instance_destroy();
}