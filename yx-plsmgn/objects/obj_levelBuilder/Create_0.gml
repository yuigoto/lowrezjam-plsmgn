/// @description Setup basic level generator variables

// If no camera is present, create one
if (global.CAMERA == noone) global.CAMERA = instance_create_depth(0, 0, 0, obj_camera);

// Reset enemy count
global.GAME_ENEMY = 0;

// Place floor instance
placer = instance_create_depth(0, 0, 0, obj_placerFloor);

// Make the camera follow the floor placer
global.CAMERA.camera_follow = obj_commandRoom;

// Destroy this instance
instance_destroy();
