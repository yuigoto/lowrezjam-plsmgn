/// @description Bootstrap debugger data

// Surface for Debug UI
dbgr = noone;

// show_debug_overlay(true);

application_surface_draw_enable(false);

pixel   = shader_get_uniform(sh_pixel, "pixel");
size    = 8;
my_time = 0;

