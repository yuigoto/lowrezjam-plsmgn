/// @description Update speed and scale
frag_spd = approach(frag_spd, 0, .5);
image_xscale = approach(image_xscale, 0, .1);
image_yscale = image_xscale;
if (image_xscale == 0) {
    instance_destroy();
}