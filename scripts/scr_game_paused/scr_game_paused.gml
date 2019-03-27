if (state_new) {
	pause_surface = surface_create(room_width, room_height);
	surface_copy(pause_surface, 0, 0, application_surface);
	
	instance_deactivate_all(true);
	instance_activate_object(obj_game_manager);
	instance_create_layer((room_width / 2) - (96 / 2), (room_height / 2) - (104 / 2), "Overlays", obj_menu_pause);
}