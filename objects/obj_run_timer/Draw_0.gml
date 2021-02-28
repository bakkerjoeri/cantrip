if (obj_game_manager.prefers_display_timer) {
	draw_set_halign(fa_left);
	draw_set_color(global.palette_2);
	draw_text(x + 96 - string_width("000:00"), y, scr_create_timestamp(obj_game_manager.run_duration));
}