if (state_new) {
	// Check if card can even be played.
	if (!selected_card) {
		state_switch("turnDecideAction");
		exit;
	}

	if (turn_of_character.ability_points < selected_card.cost) {
		state_switch("turnDecideAction");
		exit;
	}
	
	// Reveal and remove card from hand
	selected_card.is_face_up = true;
	ds_list_delete(turn_of_character.hand, ds_list_find_index(turn_of_character.hand, selected_card));
	
	// Start animating the card to the middle.
	_animation_move_to_middle_finished = false;
	_post_animation_delay_finished = false;
	_pos_starting_x = selected_card.x;
	_pos_starting_y = selected_card.y;
	_pos_target_pos_x = (room_width / 2) - (selected_card.sprite_width / 2);
	_pos_target_pos_y = (room_height / 2) - (selected_card.sprite_height / 2);
	_animation_duration = 0.5 * room_speed;
	_animation_time = 0;
	_post_animation_delay_duration = 1 * room_speed;
	_post_animation_delay_time = 0;
}

if (_animation_time < _animation_duration) {
	selected_card.x = ease_out_quint(_animation_time, _pos_starting_x, (_pos_target_pos_x - _pos_starting_x), _animation_duration);
	selected_card.y = ease_out_quint(_animation_time, _pos_starting_y, (_pos_target_pos_y - _pos_starting_y), _animation_duration);
	
	_animation_time += 1;
} else if (_animation_time >= _animation_duration) {
	_animation_move_to_middle_finished = true;
}

if (
	_animation_move_to_middle_finished
	&& _post_animation_delay_time < _post_animation_delay_duration
) {
	_post_animation_delay_time += 1;
} else if (_post_animation_delay_time >= _post_animation_delay_duration) {
	_post_animation_delay_finished = true;
}

if (
	_animation_move_to_middle_finished
	&& _post_animation_delay_finished
) {
	var target;

	if (turn_of_character == player) {
		target = opponent;
	} else {
		target = player;
	}
	
	scr_character_loses_ap(turn_of_character, selected_card.cost);

	for (e = 0; e <= ds_list_size(selected_card.effects) - 1; e += 1) {
		var effect = ds_list_find_value(selected_card.effects, e);
		
		script_execute(effect, target, turn_of_character);
	}

	ds_list_delete(turn_of_character.hand, ds_list_find_index(turn_of_character.hand, selected_card));
	ds_list_add(selected_card.owner.graveyard, selected_card);

	// Since a card can force a state switch, in which case we shouldn't return to turnDecideAction.
	if (state_name == "turnResolveCard") {
		state_switch("turnDecideAction");
	}
}


