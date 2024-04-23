function scr_game_unpaused() {
	if (state_new) {
		obj_game_manager.is_run_timer_running = true;
		instance_activate_all();
	}

	if (instance_exists(obj_menu_pause)) {
		instance_destroy(obj_menu_pause);
	}

	if (surface_exists(pause_surface)) {
		surface_free(pause_surface);
	}


}
