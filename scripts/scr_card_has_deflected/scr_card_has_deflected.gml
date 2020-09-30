function scr_card_has_deflected() {
	if (state_new) {
		depth = -1;
		is_face_up = true;
	
		if (owner == obj_battle_manager.player) {
			animation_add_next(
				x,
				y - 24,
				0.5 * room_speed,
				ease_out_quint
			);
		}
	
		if (owner == obj_battle_manager.opponent) {
			animation_add_next(
				x,
				y + 24,
				0.5 * room_speed,
				ease_out_quint
			);
		}
		
		animation_add_wait(0.25 * room_speed);
	
		exit;
	}

	if (animation_is_finished) {
		state_switch_previous();
	}
}
