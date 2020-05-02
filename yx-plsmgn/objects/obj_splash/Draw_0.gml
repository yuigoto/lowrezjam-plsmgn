/// @description Draw the splash!
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_ubuntuMono5);
draw_set_alpha(alpha);
drawTextOutlineExt(
    "©2017", 
    room_width / 2, 
    room_height / 2 - 4, 
    1, 
    1, 
    0, 
    c_white, 
    c_black
);
drawTextOutlineExt(
    "Fabio Y. Goto", 
    room_width / 2, 
    room_height / 2 + 4, 
    1, 
    1, 
    0, 
    c_yellow, 
    c_black
);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
