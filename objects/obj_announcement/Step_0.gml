if (!announcement_started) {
	text_width = string_width(text);
	
	x = room_width + (text_width / 2);
	y = room_height / 2;
	
	animation_add_next(
		room_width / 2,
		room_height / 2,
		.75 * room_speed,
		ease_out_quint,
	);
	
	animation_add_wait(.5 * room_speed);
	visible = true;
	announcement_started = true;
	exit;
}

if (announcement_started && !announcement_seen && animation_is_finished) {
	if (should_leave && !is_leaving) {
		animation_add_wait(.25 * room_speed);
	
		animation_add_next(
			0 - (text_width / 2),
			room_height / 2,
			.25 * room_speed,
			ease_in_quint,
		);
		
		is_leaving = true;
	}
	
	announcement_seen = true;
	exit;
}

animation_execute();

if (animation_is_finished && announcement_seen && is_leaving) {
	instance_destroy(self);
}