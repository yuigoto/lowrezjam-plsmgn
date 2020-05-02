/// @description Draws messages to the player, etc.

if (surface_exists(messages)) {
    // Window width and height
    var win_w, win_h, cam_w, cam_h;
    win_w = window_get_width();
    win_h = window_get_height();
    cam_w = view_wport[0];
    cam_h = view_hport[0];
    
    // Set target for drawing
    surface_set_target(messages);
    
    // Clear the surface
    draw_clear_alpha(c_white, 0);
    
    draw_set_font(fnt_ubuntuMono5);
    
    if (global.GAME_OVER) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
    
        drawTextOutlineExt(
            "GAME", 
            view_xport + 64 / 2, 
            view_yport + 64 / 2 - 20, 
            2, 
            2, 
            wave(-8, 8, .1, 0), 
            c_red, 
            c_black
        );
    
        drawTextOutlineExt(
            "OVER", 
            view_xport + 64 / 2, 
            view_yport + 64 / 2 - 4, 
            2, 
            2, 
            wave(-8, 8, .1, 0), 
            c_red, 
            c_black
        );
    
        drawTextOutlineExt(
            "LEVEL: " + string(global.GAME_CURR), 
            view_xport + 64 / 2, 
            view_yport + 64 / 2 + 12, 
            1, 
            1, 
            0, 
            c_white, 
            c_black
        );
    
        drawTextOutlineExt(
            "Shoot to proceed", 
            view_xport + 64 / 2, 
            view_yport + 64 / 2 + 24, 
            1, 
            1, 
            0, 
            c_yellow, 
            c_black
        );
    } else {
        if (global.GAME_MID) {
            if (global.GAME_PASS) {
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
            
                drawTextOutlineExt(
                    "GOOD JOB!", 
                    view_xport + 64 / 2, 
                    view_yport + 64 / 2 - 4, 
                    1, 
                    1, 
                    wave(-8, 8, .1, 0), 
                    c_yellow, 
                    c_black
                );
            
                drawTextOutlineExt(
                    "NEXT LEVEL!", 
                    view_xport + 64 / 2, 
                    view_yport + 64 / 2 + 4, 
                    1, 
                    1, 
                    wave(-8, 8, .1, 0), 
                    c_yellow, 
                    c_black
                );
            }
        }
    
        if (global.GAME_INI && !global.GAME_OK) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            
            drawTextOutlineExt(
                "GO!", 
                view_xport + 64 / 2, 
                view_yport + 64 / 2, 
                3, 
                3, 
                wave(-8, 8, .1, 0), 
                c_yellow, 
                c_black
            );
        }

        if (!global.GAME_INI) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            
            if (!global.GAME_READY) {
                drawTextOutlineExt(
                    "WELCOME!", 
                    view_xport + 64 / 2, 
                    8, 
                    1, 
                    1, 
                    wave(-8, 8, .1, 0), 
                    c_white, 
                    c_black
                );
    
                draw_set_font(fnt_plsmgnbeta);
                
                if (global.GEN_FIRST_TIME == false) {
                    drawTextOutlineExt(
                        "Shoot to skip", 
                        view_xport + 64 / 2, 
                        view_yport + 64 / 2 + 24, 
                        1, 
                        1, 
                        0, 
                        c_red, 
                        c_black
                    );
                }
            } else {
                if (global.GAME_GO && !global.GAME_OK) {
                    drawTextOutlineExt(
                        "READY?", 
                        view_xport + 64 / 2, 
                        view_yport + 64 / 2, 
                        2, 
                        2, 
                        wave(-8, 8, .1, 0), 
                        c_orange, 
                        c_black
                    );
                }
            }
        }
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Reset target
    surface_reset_target();
    
    /*
    // Draw the surface
    if (win_w != view_wport[0]) {
        var ratio = win_h / view_hport[0];
        draw_surface_ext(messages, 0, 0, ratio, ratio, 0, c_white, 1);
    } else {
        draw_surface(messages, view_xport[0], view_yport[0]);
    }
    */
    
    // Draw the surface
    if (win_w != 64) {
        var ratio = (win_w > win_h) ? win_h / 64 : win_w / 64;
        draw_surface_ext(messages, 0, 0, ratio, ratio, 0, c_white, 1);
    } else {
        draw_surface(messages, view_xport[0], view_yport[0]);
    }
} else {
    // Get camera dimensions
    var cam_w, cam_h;
    
    // Create the surface
    messages = surface_create(64, 64);
    
    // Set target for drawing
    surface_set_target(messages);
    
    // Clear surface with a color
    draw_clear_alpha(c_white, 0);
    
    // Reset target
    surface_reset_target();
    
    // Draw the surface
    draw_surface(messages, view_xport[0], view_yport[0]);
}
