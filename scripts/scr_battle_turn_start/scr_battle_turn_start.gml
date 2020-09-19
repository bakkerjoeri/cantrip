function scr_battle_turn_start() {
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
	
		turn_start_announcement = instance_create_layer(0, 0, "Instances", obj_announcement);
	
		if (turn_of_character == player) {
			turn_start_announcement.text_color = global.palette_4;
			turn_start_announcement.text = "Your turn";
		}
	
		if (turn_of_character == opponent) {
			turn_start_announcement.text_color = global.palette_5;
			turn_start_announcement.text = "Opponent's turn";
		}
	
		exit;
	}

	if (!instance_exists(turn_start_announcement) || turn_start_announcement.announcement_seen) {
		if (_effect_delay <= 0 && !ds_queue_empty(start_of_turn_effects_to_execute)) {
			var effect_to_execute = ds_queue_dequeue(start_of_turn_effects_to_execute);
	
			show_debug_message("Now executing effect " + effect_to_execute[? "name"]);
				
			var source = effect_to_execute[? "source"];
			var target = scr_get_opponent_of_character(source);
			var turnsLeft = effect_to_execute[? "duration"] - 1;
			
			script_execute(effect_to_execute[? "effect"], target, source);
			effect_to_execute[? "duration"] = turnsLeft;
	
			show_debug_message("Turns left after executing: " + string(turnsLeft));
	
			if (turnsLeft == 0) {
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
	}


}
