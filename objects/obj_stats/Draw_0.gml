draw_set_halign(fa_center);

if (obj_game_manager.current_run_streak > 1) {
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 248, "current win streak: " + string(obj_game_manager.current_run_streak));	
}

if (obj_game_manager.max_run_streak > 1) {
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 256, "longest streak: " + string(obj_game_manager.max_run_streak));	
}

if (obj_game_manager.runs_won > 0) {
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 264, "total victories: " + string(obj_game_manager.runs_won));	
}