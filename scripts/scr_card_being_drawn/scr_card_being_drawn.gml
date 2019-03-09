if (state_new) {
	depth = -1;
	
	is_face_up = owner.is_hand_visible;
	animation_add_next(
		owner.hand_x + (ds_list_find_index(owner.hand, self) * (owner.hand_width / ds_list_size(owner.hand))),
		owner.hand_y,
		.25 * room_speed,
		ease_out_quint,
	);
	
	exit;
}

if (animation_is_finished) {
	state_switch("inHand");
}
