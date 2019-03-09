if (state_new) {
	is_face_up = false;
	
	animation_add_next(
		owner.draw_pile_x,
		owner.draw_pile_y,
		.25 * room_speed,
		ease_out_quint,
	);
	
	exit;
}

if (animation_is_finished) {
	state_switch("inDrawPile");
}
