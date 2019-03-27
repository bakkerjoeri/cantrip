if (state_new) {
	instance_activate_all();
}

if (instance_exists(obj_menu_pause)) {
	instance_destroy(obj_menu_pause);
}

if (surface_exists(pause_surface)) {
	surface_free(pause_surface);
}