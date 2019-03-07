if (turn_of_character == opponent) {
	if (state_new) {
		show_debug_message("Opponent starts turn");
		_opponent_action_delay = round((1 + random(2)) * room_speed);
		show_debug_message("Starting with delay of " + string(_opponent_action_delay / room_speed));
	}
	
	if (_opponent_action_delay <= 0) {
		show_debug_message("Looking for playable cards...");
		// Find all playable cards.
		var playable_cards = ds_list_create();
		
		for (var c = 0; c <= ds_list_size(turn_of_character.hand) - 1; c += 1) {
			var card_to_check = ds_list_find_value(turn_of_character.hand, c);
			
			if (turn_of_character.ability_points >= card_to_check.cost) {
				ds_list_add(playable_cards, card_to_check);
			}
		}
		
		show_debug_message("Amount of playable cards: " + string(ds_list_size(playable_cards)));
		
		// End turn if there are no playable cards.
		if (ds_list_size(playable_cards) <= 0) {
			show_debug_message("No cards to play, ending turn.");
			state_switch("turnEnd");
			exit;
		}
		
		// Skip turn to save up on points and cards.
		if (
			turn_of_character.ability_points <= 1
			&& ds_list_size(playable_cards) <= 1
			&& irandom(4) == 1
		) {
			show_debug_message("Let's play it safe... skipping turn.");
			state_switch("turnEnd");
			exit;
		}
		
		selected_card = scr_choose_from_list(playable_cards);
		show_debug_message("Gonna play card: " + selected_card.name);
		state_switch("turnResolveCard");
		exit;
	}

	_opponent_action_delay -= 1;
}

if (turn_of_character == player) {
	var card_under_mouse =  scr_get_top_object_under_mouse(obj_card_base);
	
	if (ds_list_find_index(player.hand, card_under_mouse) >= 0) {
		obj_battle_manager.card_with_focus = card_under_mouse;
	} else {
		obj_battle_manager.card_with_focus = noone;
	}
}