/// @description Updates status

// Update image speed when triggered
if (triggered && !finished && image_speed == 0) image_speed = 0.5;

// If the image is the last frame, stop
if (triggered && image_index >= image_number - 1) {
    finished = true;
    image_speed = 0;
}
