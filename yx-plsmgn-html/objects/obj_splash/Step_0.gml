/// @description Update alpha
if (!finish) {
    alpha = approach(alpha, 1, 0.05);
    if (alpha == 1) finish = true;
    alarm[0] = room_speed * 1.5;
}

if (trigger) {
    alpha = approach(alpha, 0, 0.05);
    if (alpha == 0) {
        room_goto(rm_titleScreen);
        instance_destroy();
    }
}
