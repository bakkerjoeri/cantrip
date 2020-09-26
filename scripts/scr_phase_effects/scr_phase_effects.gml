function execute_phase_effect(effect) {
	show_debug_message("Now executing effect " + effect[? "name"]);
		
	var source = effect[? "source"];
	var target = scr_get_opponent_of_character(source);
		
	if (ds_map_exists(effect, "duration")) {
		script_execute(effect[? "effect"], target, source, effect[? "duration"]);
		show_debug_message("Turns left after executing: " + string(effect[? "duration"]));
	} else if (ds_map_exists(effect, "card")) {
		script_execute(effect[? "effect"], target, source, effect[? "card"]);
	} else {
		script_execute(effect[? "effect"], target, source);
	}
}

function get_start_of_turn_effects(character) {
	var start_of_turn_effects_to_execute = ds_queue_create();
	
	if (!ds_list_empty(character.start_of_turn_effects)) {
		var cloned_list = scr_clone_list(character.start_of_turn_effects);

		for (var e = 0; e <= ds_list_size(cloned_list) - 1; e += 1) {
			var effect = ds_list_find_value(cloned_list, e);
			
			if (effect[? "duration"] <= 0) {
				scr_remove_item_from_list(character.start_of_turn_effects, effect);
			} else {
				effect[? "duration"] -= 1;
				
				ds_queue_enqueue(start_of_turn_effects_to_execute, effect);
			}
		}
		
		ds_list_destroy(cloned_list);
	}
	
	for (var c = 0; c <= ds_list_size(character.hand) - 1; c += 1) {
		var card = ds_list_find_value(character.hand, c);
		
		if (variable_instance_exists(card, "on_turn_start")) {
			var effect_map = ds_map_create();
			effect_map[? "card"] = card;
			effect_map[? "source"] = card.owner;
			effect_map[? "name"] = card.name;
			effect_map[? "effect"] = card.on_turn_start;

			ds_queue_enqueue(start_of_turn_effects_to_execute, effect_map);
		}
	}
	
	return start_of_turn_effects_to_execute;
}

function get_end_of_turn_effects(character) {
	var end_of_turn_effects_to_execute = ds_queue_create();

	if (!ds_list_empty(character.end_of_turn_effects)) {
		var cloned_list = scr_clone_list(character.end_of_turn_effects);
		
		for (var e = 0; e <= ds_list_size(cloned_list) - 1; e += 1) {
			var effect = ds_list_find_value(cloned_list, e);
			
			if (effect[? "duration"] <= 0) {
				scr_remove_item_from_list(character.end_of_turn_effects, effect);
			} else {
				effect[? "duration"] -= 1;
				
				ds_queue_enqueue(end_of_turn_effects_to_execute, effect);
			}
		}
	}
	
	for (var c = 0; c <= ds_list_size(character.hand) - 1; c += 1) {
		var card = ds_list_find_value(character.hand, c);
		
		if (variable_instance_exists(card, "on_turn_end")) {
			var effect_map = ds_map_create();
			effect_map[? "card"] = card;
			effect_map[? "source"] = card.owner;
			effect_map[? "name"] = card.name;
			effect_map[? "effect"] = card.on_turn_end;

			ds_queue_enqueue(end_of_turn_effects_to_execute, effect_map);
		}
	}
	
	return end_of_turn_effects_to_execute;
}