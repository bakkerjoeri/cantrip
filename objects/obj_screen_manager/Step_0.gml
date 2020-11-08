if (!obj_game_manager.prefers_screen_shake) {
	shake = 0;
}

if (shake > 0) {
	camera_set_view_pos(
		view_camera[0],
		irandom_range(-shake, shake),
		irandom_range(-shake, shake)
	);

	shake -= 1;
}