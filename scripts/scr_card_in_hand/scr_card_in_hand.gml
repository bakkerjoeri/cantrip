function scr_card_in_hand() {
	if (state_new) {
		previous_hand_size = 0;
		previous_hand_position = -1;
	}
	
	if (owner.state_name == "takingDamage") {
		exit;
	}

	var current_hand_size = ds_list_size(owner.hand);
	var current_hand_position = ds_list_find_index(owner.hand, self.id);
	is_face_up = owner.is_hand_visible;
	
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
			.2 * room_speed,
			ease_out_quint,
		);
		
		previous_hand_position = current_hand_position;
		previous_hand_size = current_hand_size;
	}

	// Change depth and position based on focus
	if (obj_battle_manager.card_with_focus == self.id) {
		if (owner.is_hand_visible) {
			depth = 0;
		}
	
		if (
			!has_focus
			&& owner.is_hand_visible
			&& animation_is_finished
		) {
			var offset = 3 * owner.offset_direction;
		
			if (
				scr_can_character_play_card(owner, self.id)
				&& owner.state_name == "deciding"
				&& owner.is_controlled_by_player
			) {
				offset = 12 * owner.offset_direction;
			}
		
			has_focus = true;
			animation_add_next(
				x,
				owner.hand_y + offset,
				.1 * room_speed,
				ease_in_out_quint,
			);
		}
	} else {
		if (has_focus && animation_is_finished) {
			has_focus = false;
			animation_add_next(
				x,
				owner.hand_y,
				.1 * room_speed,
				ease_in_out_quint,
			);
		}
	
		if (
			owner.is_hand_visible &&
			obj_battle_manager.card_with_focus &&
			obj_battle_manager.card_with_focus.owner == owner &&
			scr_does_list_contain_item(owner.hand, obj_battle_manager.card_with_focus)
		) {
			depth = abs(ds_list_find_index(owner.hand, obj_battle_manager.card_with_focus) - current_hand_position);
		} else {
			depth = (current_hand_size - 1) - current_hand_position;
		}
	}

	if (
		obj_battle_manager.state_name == "turnPlayPhase"
		&& obj_battle_manager.turn_of_character == owner
		&& obj_battle_manager.turn_of_character.is_controlled_by_player
		&& obj_battle_manager.turn_of_character.state_name == "deciding"
		&& obj_battle_manager.card_with_focus == self.id
		&& mouse_check_button_released(mb_left)
		&& scr_can_character_play_card(owner, self.id)
	) {
		ds_queue_enqueue(owner.cards_to_play, self.id);
	}
}
