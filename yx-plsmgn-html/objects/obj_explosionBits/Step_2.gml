/// @description Update fragment position
var move_x = lengthdir_x(frag_spd, frag_dir), 
    move_y = lengthdir_y(frag_spd, frag_dir);

x += (place_meeting(x + move_x, y, obj_parentWall)) ? move_x * -1 : move_x;
y += (place_meeting(x, y + move_y, obj_parentWall)) ? move_y * -1 : move_y;
