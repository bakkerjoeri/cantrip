if (!is_leaving) {
	animation_cancel();
	
	animation_add_next(
		0 - (text_width / 2),
		room_height / 2,
		.5 * room_speed,
		ease_in_quint,
	);

	is_leaving = true;
}