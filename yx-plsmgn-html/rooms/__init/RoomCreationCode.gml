/// @description  Bootstrap game code and stuff, then move to the next screen

// Add persistent debugger object (while dev)
if (instance_number(__debugger) < 1) {
    // Run boot script
    __boot();
    instance_create_depth(x, y, 0, __debugger);
}

// Set application surface size
// surface_resize(application_surface, 64, 64);

// Move to the next room
room_goto(room_next(room));
