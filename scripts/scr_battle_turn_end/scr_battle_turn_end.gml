function scr_battle_turn_end() {
	if (state_new) {
		_effect_delay = 0;
		end_of_turn_effects_to_execute = ds_queue_create();
	
		if (ds_list_size(turn_of_character.end_of_turn_effects) > 0) {
			for (var e = 0; e <= ds_list_size(turn_of_character.end_of_turn_effects) - 1; e += 1) {
				ds_queue_enqueue(
					start_of_turn_effects_to_execute,
					ds_list_find_value(turn_of_character.end_of_turn_effects, e),
				);
			}
		}
		
		exit;
	}
	
	if (_effect_delay <= 0 && !ds_queue_empty(end_of_turn_effects_to_execute)) {
		var effect_to_execute = ds_queue_dequeue(end_of_turn_effects_to_execute);
	
		show_debug_message("Now executing effect " + effect_to_execute[? "name"]);
		
		var source = effect_to_execute[? "source"];
		var target = scr_get_opponent_of_character(source);
		
		script_execute(effect_to_execute[? "effect"], target, source);
		effect_to_execute[? "duration"] -= 1;
	
		show_debug_message("Turns left after executing: " + string(effect_to_execute[? "duration"]));
	
		if (effect_to_execute[? "duration"] == 0) {
			ds_list_delete(
				turn_of_character.end_of_turn_effects,
				ds_list_find_index(turn_of_character.end_of_turn_effects, effect_to_execute)
			);
		}
	
		_effect_delay = 0.5 * room_speed;
	
		exit;
	}
	
	if (
		_effect_delay <= 0
		&& ds_queue_empty(start_of_turn_effects_to_execute)
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
