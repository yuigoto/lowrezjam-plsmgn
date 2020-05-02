/// @description Bootstraps control and game specific variables
/// @function __boot

// Bootstrap controls
controlsInit();

// Define Macros
#macro CELL_W 8
#macro CELL_H 8

// Bootstrap game variables
__bootVars();

// Set cursor to none and load crosshair
window_set_cursor(cr_cross);
if (global.CROSSHAIR == noone) global.CROSSHAIR = instance_create_depth(0, 0, -9999, obj_crosshair);
