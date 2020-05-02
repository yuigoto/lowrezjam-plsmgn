/// @description Draw the guided user interface
if (surface_exists(srfc)) {
    // Window width and height
    var win_w, win_h, cam_w, cam_h;
    win_w = window_get_width();
    win_h = window_get_height();
    cam_w = camera_get_view_width(view_camera[0]);
    cam_h = camera_get_view_height(view_camera[0]);
    
    // Set target for drawing
    surface_set_target(srfc);
    
    // Clear the surface
    draw_clear_alpha(c_white, 0);
    
    // Define player plasma
    var player_ammo = (global.PLAYER.ammo > 0) ? global.PLAYER.ammo / global.PLAYER.ammo_max : 0;
    var player_gund = (global.PLAYER.gun_damage > 0) ? global.PLAYER.gun_damage / global.PLAYER.gun_damage_max : 0;
    
    // Set drawing size
    var bar_x, bar_y, bar_w, bar_h;
    bar_t = cam_h - 4;
    bar_l = 0;
    bar_r = cam_w / 4;
    bar_b = cam_h;
    
    // Draw all your text here
    draw_set_color(c_white);
    draw_rectangle(bar_l, bar_t, bar_r, bar_b, false);
    if (player_ammo > 0) {
        draw_set_color(c_blue);
        draw_rectangle(bar_l + 1, bar_t + 1, player_ammo * (bar_r - 1), bar_b - 2, false);
    }
    
    bar_l = cam_w - bar_r;
    bar_r = bar_l + cam_w / 4;
    
    // Draw all your text here
    draw_set_color(c_white);
    draw_rectangle(bar_l, bar_t, bar_r, bar_b, false);
    if (player_gund > 0) {
        draw_set_color(c_red);
        draw_rectangle(bar_l + 1, bar_t + 1, bar_l + player_gund * (cam_w / 4 - 2), bar_b - 2, false);
    } else {
        draw_set_color(c_orange);
        draw_set_alpha(wave(0, 1, .05, 0));
        draw_rectangle(bar_l + 1, bar_t + 1, bar_l + cam_w / 4 - 2, bar_b - 2, false);
        draw_set_alpha(1);
    }
    
    // Draw current level
    draw_set_font(fnt_ubuntuMono5);
    draw_set_halign(fa_center);
    drawTextOutline("LV.1", cam_w / 2, cam_h - 8, c_white, c_black);
    
    /*
    // Draw messages
    draw_set_font(fnt_anonymousPro7);
    draw_set_halign(fa_center);
    drawTextOutlineExt(
        "GOOD JOB!", 
        cam_w / 2, 
        cam_h / 2, 
        1, 
        1, 
        wave(-10, 10, .1, 0), 
        c_orange, 
        c_black
    );
    */
    
    draw_set_halign(fa_left);
    draw_set_halign(fa_center);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    if (win_w != cam_w) {
        var ratio = (win_w > win_h) ? win_h / cam_h : win_w / cam_w;
        draw_surface_ext(srfc, 0, 0, ratio, ratio, 0, c_white, 1);
    } else {
        draw_surface(srfc, view_xport[0], view_yport[0]);
    }
} else {
    // Get camera dimensions
    var cam_w, cam_h;
    cam_w = 64;
    cam_h = 64;
    
    // Create the surface
    srfc = surface_create(cam_w, cam_h);
    
    // Set target for drawing
    surface_set_target(srfc);
    
    // Clear surface with a color
    draw_clear_alpha(c_white, 0);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    draw_surface(srfc, view_xport[0], view_yport[0]);
}
