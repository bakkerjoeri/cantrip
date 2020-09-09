function scr_card_damaged() {
	if (state_new) {
		depth = -1;
		is_face_up = true;
	
		if (owner == obj_battle_manager.player) {
			animation_add_next(
				round(random_range(x - 8, x + 8)),
				round(random_range(y - 16, y - 24)),
				0.75 * room_speed,
				ease_out_quint
			);
		}
	
		if (owner == obj_battle_manager.opponent) {
			animation_add_next(
				round(random_range(x - 8, x + 8)),
				round(random_range(y + 16, y + 24)),
				0.75 * room_speed,
				ease_out_quint
			);
		}
	
		exit;
	}

	if (animation_is_finished) {
		state_switch("beingDiscarded");
	}


}
