/// @description Update speed and scale
frag_spd = frag_spd * 0.8;
if (frag_spd < 0.1) frag_spd = 0;
image_xscale = approach(image_xscale, 0, .01);
image_yscale = image_xscale;
if (image_xscale == 0) {
    instance_destroy();
}