draw_set_halign(fa_center);

if (obj_game_manager.current_run_streak > 1) {
	var current_run_streak_message = "current win streak: " + string(obj_game_manager.current_run_streak);
	
	draw_set_halign(fa_center);
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 248, current_run_streak_message);
	
	if (room == room_victory && obj_game_manager.current_run_streak_change > 0) {
		var message_width = string_width(current_run_streak_message);
		
		draw_set_halign(fa_left);
		draw_set_colour(global.palette_1);
		draw_text(room_width / 2 + (message_width / 2), 248, " (+" + string(obj_game_manager.current_run_streak_change) + ")");
	}
}

if (obj_game_manager.max_run_streak > 1) {
	var max_run_streak_message = "longest streak: " + string(obj_game_manager.max_run_streak);
	draw_set_halign(fa_center);
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 256, max_run_streak_message);	
	
	if (room == room_victory && obj_game_manager.max_run_streak_change > 0) {
		var message_width = string_width(max_run_streak_message);
		
		draw_set_halign(fa_left);
		draw_set_colour(global.palette_1);
		draw_text(room_width / 2 + (message_width / 2), 256, " (+" + string(obj_game_manager.max_run_streak_change) + ")");
	}
}

if (obj_game_manager.runs_won > 0) {
	var runs_won_message = "total victories: " + string(obj_game_manager.runs_won);
	draw_set_halign(fa_center);
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 264, runs_won_message);
	
	if (room == room_victory && obj_game_manager.runs_won_change > 0) {
		var message_width = string_width(runs_won_message);
		
		draw_set_halign(fa_left);
		draw_set_colour(global.palette_1);
		draw_text(room_width / 2 + (message_width / 2), 264, " (+" + string(obj_game_manager.runs_won_change) + ")");
	}
}

if (obj_game_manager.min_run_duration != undefined) {
	var min_run_duration_message = "fastest run: " + scr_create_timestamp(obj_game_manager.min_run_duration, true);
	draw_set_halign(fa_center);
	draw_set_colour(global.palette_4);
	draw_text(room_width / 2, 272, min_run_duration_message);
	
	if (room == room_victory && obj_game_manager.min_run_duration_change > 0) {
		var message_width = string_width(min_run_duration_message);
		
		draw_set_halign(fa_left);
		draw_set_colour(global.palette_1);
		draw_text(room_width / 2 + (message_width / 2), 272, " (-" + string(floor(obj_game_manager.min_run_duration_change)) + " seconds)");
	}
}