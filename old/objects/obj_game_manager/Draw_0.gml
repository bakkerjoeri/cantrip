if (debug_mode) {
	draw_set_color(global.palette_1);
	draw_set_halign(fa_left);
	draw_text(64, 8, "game: " + state_name);
	
	if (!is_undefined(current_floor) && !is_undefined(current_room)) {
		draw_text(64, 32, "room tier " + string(current_room[? "room_tier"]));
		draw_text(64, 40, "reward tier " + string(current_room[? "reward_tier"]));
	}
}