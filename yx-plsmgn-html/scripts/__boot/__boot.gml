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

show_debug_message(
    stringExplode("//", "This is//a very nice//string example.")
);

show_debug_message(
    stringExplode("{BOB}", "This is{BOAB}a very nice{BOB}string example.")
);

var as = stringExplode("//", "This is//a very nice//string example.");
show_debug_message(as[0]);
show_debug_message(as[1]);
show_debug_message(as[2]);
