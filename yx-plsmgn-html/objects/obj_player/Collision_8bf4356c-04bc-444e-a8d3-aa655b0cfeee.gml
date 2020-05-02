/// @description Delete canister and collect ammo
with (other) instance_destroy();
ammo += 20;
ammo = clamp(ammo, 0, ammo_max);
audio_play_sound(snd_canister, 0, 0);
for (var i = 0; i < 8; i++) {
    var frag = instance_create_depth(x, y, depth - 1, obj_plasmaBits);
    frag.image_xscale = .5;
}
