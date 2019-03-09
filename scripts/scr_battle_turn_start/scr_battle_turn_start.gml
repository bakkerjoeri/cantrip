if (state_new) {
	_effect_delay = 0;
	start_of_turn_effects_to_execute = ds_queue_create();
	
	if (ds_list_size(turn_of_character.start_of_turn_effects) > 0) {
		for (var e = 0; e <= ds_list_size(turn_of_character.start_of_turn_effects) - 1; e += 1) {
			ds_queue_enqueue(
				start_of_turn_effects_to_execute,
				ds_list_find_value(turn_of_character.start_of_turn_effects, e),
			);
		}
	}
}

if (_effect_delay <= 0 && !ds_queue_empty(start_of_turn_effects_to_execute)) {
	var effect_to_execute = ds_queue_dequeue(start_of_turn_effects_to_execute);
	
	show_debug_message("Now executing effect " + effect_to_execute[? "name"]);
	
	script_execute(effect_to_execute[? "effect"], turn_of_character);
	effect_to_execute[? "duration"] -= 1;
	
	show_debug_message("Turns left after executing: " + string(effect_to_execute[? "duration"]));
	
	if (effect_to_execute[? "duration"] == 0) {
		ds_list_delete(
			turn_of_character.start_of_turn_effects,
			ds_list_find_index(turn_of_character.start_of_turn_effects, effect_to_execute)
		);
	}
	
	_effect_delay = 0.5 * room_speed;
	
	exit;
}

if (
	_effect_delay <= 0 &&
	ds_queue_empty(start_of_turn_effects_to_execute) &&
	turn_of_character.state_name == "waiting"
) {
	ds_queue_destroy(start_of_turn_effects_to_execute);
	state_switch("turnDrawPhase");
	
	exit;
}

_effect_delay -= 1;