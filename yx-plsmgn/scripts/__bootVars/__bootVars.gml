/// @description Bootstrap game specific variables
/// @function __bootVars

// Define Global Handlers
global.PLAYER           = noone;
global.CAMERA           = noone;
global.CAMERA_GENERIC   = noone;
global.CROSSHAIR        = noone;
global.MUSIC            = noone;
global.SOUND_HISTORY    = noone;
global.HUD              = noone;

// Game Management
global.GAME_INI         = false;
global.GAME_MID         = false;
global.GAME_END         = false;
global.GAME_READY       = false;
global.GAME_GO          = false;
global.GAME_OK          = false;
global.GAME_CURR        = 1;
global.GAME_PASS        = false;
global.GAME_OVER        = false;
global.GAME_BUILD       = false;
global.GAME_ENEMY       = 0;
global.GAME_ENEMY_MAX   = 20;

// Generator Variables
global.GEN_OFFX         = 0;
global.GEN_OFFY         = 80;
global.GEN_STEPS        = 600;
global.GEN_TILES        = 400;
global.GEN_ODDS         = 100;
global.GEN_PLACED       = 0;
global.GEN_WALKED       = 0;
global.GEN_PLAYERX      = 0;
global.GEN_PLAYERY      = 0;
global.GEN_PATHGRID     = noone;
global.GEN_FIRST_TIME   = false;
