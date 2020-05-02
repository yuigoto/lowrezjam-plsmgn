/// @description If image index == 0 or less, destroy
if (image_index <= 1 && triggered) {
    instance_destroy();
} else {
    triggered = true;
}
