if (debug_mode) {
	draw_set_color(global.palette_1);
	draw_set_halign(fa_left);
	draw_text(384, 26, "battle state: " + state_name);
}

if (!is_undefined(obj_game_manager.current_room)) {
	draw_set_halign(fa_left);
	draw_set_color(global.palette_2);
	draw_text(4, 40, obj_game_manager.current_room[? "type"] + " " + string(obj_game_manager.current_room_number) + "-" + string(obj_game_manager.current_floor_number));
}