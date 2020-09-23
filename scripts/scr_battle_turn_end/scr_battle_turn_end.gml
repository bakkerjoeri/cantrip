function scr_battle_turn_end() {
	if (state_new) {
		_effect_delay = 0;
		end_of_turn_effects_to_execute = get_end_of_turn_effects(turn_of_character);
		exit;
	}
	
	if (_effect_delay <= 0 && !ds_queue_empty(end_of_turn_effects_to_execute)) {
		var effect_to_execute = ds_queue_dequeue(end_of_turn_effects_to_execute);
		execute_phase_effect(effect_to_execute);
		_effect_delay = 0.25 * room_speed;
	
		exit;
	}
	
	if (
		_effect_delay <= 0
		&& ds_queue_empty(end_of_turn_effects_to_execute)
		&& (player.state_name == "waiting" || player.state_name == "deciding")
		&& (opponent.state_name == "waiting" || opponent.state_name == "deciding")
	) {
		// Set the current character to waiting.
		with (turn_of_character) {
			state_switch("waiting");
		}
	
		// Switch turns to the other character.
		turn_of_character = scr_get_opponent_of_character(turn_of_character);

		state_switch("turnStart");
	}

	_effect_delay -= 1;
}