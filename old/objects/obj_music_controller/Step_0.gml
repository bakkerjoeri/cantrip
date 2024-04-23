if (debug_mode) {
	if (keyboard_check_pressed(vk_tab)) {
		if (current_track) {
			audio_stop_sound(current_track);
		}
		
		current_track = undefined;
	}
}

if (!obj_game_manager.prefers_music && current_track && !audio_is_paused(current_track)) {
	audio_pause_sound(current_track);
}

if (obj_game_manager.prefers_music && current_track && audio_is_paused(current_track)) {
	audio_resume_sound(current_track);
}

if (ds_list_empty(track_pool) && ds_list_empty(track_queue)) {
	return;
}

if (ds_list_empty(track_queue)) {
	var new_queue = scr_clone_list(track_pool);
	ds_list_shuffle(new_queue);
	scr_move_all_items_between_lists(new_queue, track_queue);
	ds_list_destroy(new_queue);
}

// Do not switch music while drafting before going to a new floor.
if (obj_game_manager.state_name == "draft") {
	return;
}

if (!current_track || !audio_is_playing(current_track)) {
	current_track = ds_list_find_value(track_queue, 0);
	ds_list_delete(track_queue, 0);
	audio_play_sound(current_track, 0, false);
}