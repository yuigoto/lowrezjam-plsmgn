/// @description Delete canister and recover damage
with (other) instance_destroy();
gun_damage += 10;
gun_damage = clamp(gun_damage, 0, gun_damage_max);
audio_play_sound(snd_canisterRed, 0, 0);
for (var i = 0; i < 8; i++) {
    var frag = instance_create_depth(x, y, depth - 1, obj_damageBits);
    frag.image_xscale = .5;
}
