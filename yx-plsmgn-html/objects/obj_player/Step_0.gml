/// @description Checking player inputs
if (global.GAME_PASS == false) {
    // Player input
    var move_h	= movementRight() - movementLeft(), 
    	move_v	= movementDown() - movementUp(), 
    	dash	= action2Pressed() || mouse_check_button_pressed(mb_right), 
    	shot	= action1() || mouse_check_button(mb_left);

    // Update Speed
    if (move_h != 0) {
    	if (sign(spd_x) != sign(move_h)) {
    		spd_x = approach(spd_x, 0, fact_decel);
    	}
    	spd_x = approach(spd_x, spd_max * sign(move_h), fact_accel);
    } else {
    	spd_x = approach(spd_x, 0, fact_decel);
    }

    if (move_v != 0) {
    	if (sign(spd_y) != sign(move_v)) {
    		spd_y = approach(spd_y, 0, fact_decel);
    	}
    	spd_y = approach(spd_y, spd_max * sign(move_v), fact_accel);
    } else {
    	spd_y = approach(spd_y, 0, fact_decel);
    }

    // Handle firing
    if (shot && !dash && dash_spd == 0) {
        if (!gun_firing) {
            gun_firing = true;
            alarm[0] = 3;
        }
    } else {
        gun_firing = false;
        gun_time = 0;
    }

    // Handle dash
    if (
        !shot 
        && dash 
        && (spd_x != 0 || spd_y != 0) 
        && !dash_status 
        && dash_spd == 0 
        && ammo > 4
    ) {
        dash_status = true;
        dash_spd    = dash_max;
        gun_damage -= 4;
        ammo -= 4;
    
        audio_play_sound(snd_dash, 0, 0);
    } else {
        dash_spd = approach(dash_spd, 0, 0.1);
    
        if (dash_spd > 0 && dash_spd % 0.3 == 0.30) {
            instance_create_depth(x, y, depth + 1, obj_dust);
        }
    
        if (dash_spd == 0) dash_status = false;
    }

    // The gun is leaking
    if (ammo > 0) {
        if (!gun_leaking) {
            gun_leaking = true;
            alarm[1] = (room_speed / 2) + ((gun_damage/gun_damage_max) * gun_leak);
        }
    } else {
        gun_leaking = false;
    }
}
