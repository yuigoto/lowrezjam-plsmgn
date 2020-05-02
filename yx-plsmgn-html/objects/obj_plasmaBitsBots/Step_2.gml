/// @description Update fragment position
x += lengthdir_x(frag_spd, frag_dir);
y += lengthdir_y(frag_spd, frag_dir);

if (place_meeting(x, y, obj_parentWall)) instance_destroy();
