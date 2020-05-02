/// @description Avoid wall collisions
event_inherited();

var new_x = 0;
var new_y = 0;
if (is_facing == 180)   new_x = -enemy_speed;
if (is_facing == 0)     new_x = enemy_speed;
if (is_facing == 270)   new_y = enemy_speed;
if (is_facing == 90)    new_y = -enemy_speed;

if (new_x != 0 || new_y != 0) {
    if (!place_meeting(x + new_x, y + new_y, obj_parentWall)) {
        repeat(abs(new_x)) {
            x += sign(new_x);
        }
        
        repeat(abs(new_y)) {
            y += sign(new_y);
        }
    } else {
        is_facing = choose(0, 90, 180, 270);
    }
}
