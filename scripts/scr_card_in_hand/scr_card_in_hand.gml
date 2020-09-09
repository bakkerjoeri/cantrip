function scr_card_in_hand() {
	if (state_new) {
		previous_hand_size = 0;
		previous_hand_position = -1;
	}

	var current_hand_size = ds_list_size(owner.hand);
	var current_hand_position = ds_list_find_index(owner.hand, self);

	// Animate to new position if hand composition has changed
	if (
		current_hand_position != -1 && (
			current_hand_size != previous_hand_size ||
			current_hand_position != previous_hand_position ||
			state_new
		)
	) {
		animation_add_next(
			scr_calculate_position_x_in_hand(
				current_hand_position,
				current_hand_size,
				owner.hand_x,
				owner.hand_width
			),
			owner.hand_y,
			.25 * room_speed,
			ease_out_quint,
		);
	}

	// Change depth and position based on focus
	if (obj_battle_manager.card_with_focus == self) {
		depth = 0;
	
		if (!has_focus) {
			var offset = 3;
		
			if (scr_can_character_play_card(owner, self)) {
				offset = 12;
			}
		
			has_focus = true;
			animation_cancel();
			animation_add_next(
				x,
				owner.hand_y - offset,
				.1 * room_speed,
				ease_in_out_quint,
			);
		}
	} else {
		if (has_focus) {
			has_focus = false;
			animation_cancel();
			animation_add_next(
				x,
				owner.hand_y,
				.1 * room_speed,
				ease_in_out_quint,
			);
		}
	
		if (owner.is_hand_visible && obj_battle_manager.card_with_focus) {
			depth = abs(ds_list_find_index(owner.hand, obj_battle_manager.card_with_focus) - current_hand_position);
		} else {
			depth = (current_hand_size - 1) - current_hand_position;
		}
	}

	if (
		obj_battle_manager.state_name == "turnPlayPhase"
		&& obj_battle_manager.turn_of_character == owner
		&& obj_battle_manager.turn_of_character == obj_battle_manager.player
		&& obj_battle_manager.turn_of_character.state_name == "deciding"
		&& obj_battle_manager.card_with_focus == self
		&& mouse_check_button_released(mb_left)
		&& scr_can_character_play_card(owner, self)
	) {
		ds_queue_enqueue(owner.cards_to_play, self);
	}

	previous_hand_position = current_hand_position;
	previous_hand_size = current_hand_size;


}
