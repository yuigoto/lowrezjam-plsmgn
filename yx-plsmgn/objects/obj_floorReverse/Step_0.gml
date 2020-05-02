/// @description Updates status

// Trigger animation
if (!triggered) triggered = true;

// Update image speed when triggered
if (triggered && !finished && image_speed == 0) image_speed -= 0.5;

// If the image is the last frame, stop
if (triggered && image_index <= 1) {
    instance_destroy();
}
