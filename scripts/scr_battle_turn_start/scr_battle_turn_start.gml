function scr_battle_turn_start() {
	if (state_new) {
		_effect_delay = 0;
		start_of_turn_effects_to_execute = get_start_of_turn_effects(turn_of_character);

		turn_start_announcement = instance_create_layer(0, 0, "Messages", obj_announcement);
	
		if (turn_of_character == player) {
			turn_start_announcement.text_color = global.palette_4;
			turn_start_announcement.text = "Your turn";
		}
	
		if (turn_of_character == opponent) {
			turn_start_announcement.text_color = global.palette_5;
			turn_start_announcement.text = "Foe's turn";
		}
		
		scr_add_event_log(" - " + turn_of_character.name + "'s turn -");
	
		exit;
	}

	if (_effect_delay <= 0 && !ds_queue_empty(start_of_turn_effects_to_execute)) {
		var effect_to_execute = ds_queue_dequeue(start_of_turn_effects_to_execute);
		execute_phase_effect(effect_to_execute);
		
		_effect_delay = 0.25 * room_speed;
	
		exit;
	}

	if (
		_effect_delay <= 0
		&& turn_of_character.state_name == "waiting"
		&& ds_queue_empty(start_of_turn_effects_to_execute)
		&& (
			(turn_of_character == opponent && turn_start_announcement.announcement_seen)
			|| turn_of_character == player
		)
	) {
		ds_queue_destroy(start_of_turn_effects_to_execute);
		state_switch("turnDrawPhase");
	
		exit;
	}

	_effect_delay -= 1;
}
