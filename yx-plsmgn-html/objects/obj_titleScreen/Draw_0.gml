/// @description Draws the script rotated

// Draw title
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, wave(-12, 12, .1, 0), c_white, 1);

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(fnt_ubuntuMono5);
drawTextOutline(
    "Shoot or click\nto Play", 
    room_width / 2, 
    40, 
    c_white, 
    c_black
);
draw_set_halign(fa_left);
