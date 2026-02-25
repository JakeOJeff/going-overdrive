
if (!variable_global_exists("game_won")) {
    global.game_won = false;
}
var hsp = 0;

if (global.game_won == false) {
    ysp += 0.1;
    ysp = clamp(ysp, -10, 10);
    
    walkSpeed = 2;
    if (keyboard_check(vk_shift)) walkSpeed = 4;

    if (keyboard_check(ord("D"))) hsp += walkSpeed;
    if (keyboard_check(ord("A"))) hsp -= walkSpeed;
}

if (hsp != 0) && (global.game_won == false) {
    if (sprite_index != sRun) sprite_index = sRun;
    image_speed = walkSpeed / 3;
	    image_xscale = sign(hsp);

} else {
    image_speed = 0;
    image_index = 0;
}
if place_meeting(x, y + 1, tilemap) {
	ysp = 0;
	if keyboard_check(ord("W")) {
		ysp = -3;
	}
}
if place_meeting(x, y, NextLevel) {
	room_goto_next()	
}

if place_meeting(x, y, WinLevel) {
	global.game_won = true
	room_goto_next()
}

if (global.game_won == true) && (keyboard_check(ord("R"))) {
	room_goto(0)
	global.game_won = false
}

if (global.game_won == false){
	move_and_collide(hsp, ysp, tilemap);

}