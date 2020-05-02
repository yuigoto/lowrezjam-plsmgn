/// @description Checks for collisions with the grid
/// @function grid_place_meeting
/// @param x 
/// @param y

if (global.GEN_PATHGRID != noone) {
    var _x = argument[0];
    var _y = argument[1];

    // Remember position
    var x_p = x;
    var y_p = y;

    // Update position for boundind box calculations
    x = _x - global.GEN_OFFX;
    y = _y - global.GEN_OFFY;

    var x_meeting = (global.GEN_PATHGRID[# bbox_right div CELL_W, bbox_top div CELL_H] != TYPE.TILE) || 
                    (global.GEN_PATHGRID[# bbox_left div CELL_W, bbox_top div CELL_H] != TYPE.TILE);
                
    var y_meeting = (global.GEN_PATHGRID[# bbox_right div CELL_W, bbox_bottom div CELL_H] != TYPE.TILE) || 
                    (global.GEN_PATHGRID[# bbox_left div CELL_W, bbox_bottom div CELL_H] != TYPE.TILE);
                
    var center_meeting = global.GEN_PATHGRID[# (_x - global.GEN_OFFX) div CELL_W, (_y - global.GEN_OFFX) div CELL_H] != TYPE.TILE;
                
    // Move back player
    x = x_p;
    y = y_p;

    // Return
    return x_meeting || y_meeting || center_meeting;
} else {
    // Fallback
    return false;
}
