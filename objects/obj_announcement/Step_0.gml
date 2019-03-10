if (!announcement_started) {
	text_width = string_width(text);
	
	x = room_width + (text_width / 2);
	y = room_height / 2;
	
	animation_add_next(
		room_width / 2,
		room_height / 2,
		1 * room_speed,
		ease_out_quint,
	);
	
	animation_add_wait(0.25 * room_speed);
	visible = true;
	announcement_started = true;
	exit;
}

if (announcement_started && !announcement_seen && animation_is_finished) {
	animation_add_wait(0.75 * room_speed);
	
	animation_add_next(
		0 - (text_width / 2),
		room_height / 2,
		.5 * room_speed,
		ease_in_quint,
	);
	
	announcement_seen = true;
	exit;
}

animation_execute();