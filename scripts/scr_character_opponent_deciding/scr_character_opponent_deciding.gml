if (!ds_queue_empty(cards_to_discard)) {
	state_switch("discardingCards");
	exit;
}

if (!ds_queue_empty(cards_to_play)) {
	state_switch("playingCards");
	exit;
}

if (amount_of_cards_to_draw > 0) {
	state_switch("drawingCards");
	exit;
}

if (damage_to_take > 0) {
	state_switch("takingDamage");
	exit;
}

if (obj_battle_manager.state_name == "turnPlayPhase") {
	if (state_new) {
		show_debug_message("Opponent is deciding what to do next...");
		_action_delay = round((1 + random(2)) * room_speed);
		show_debug_message("Deciding with a delay of " + string(_action_delay / room_speed) + " seconds");
	}

	if (_action_delay <= 0) {
		show_debug_message("Looking for playable cards...");
		// Find all playable cards.
		var playable_cards = ds_list_create();
		
		for (var c = 0; c <= ds_list_size(hand) - 1; c += 1) {
			var card_to_check = ds_list_find_value(hand, c);
			
			if (scr_can_character_play_card(self, card_to_check)) {
				ds_list_add(playable_cards, card_to_check);
			}
		}
		
		show_debug_message("Amount of playable cards: " + string(ds_list_size(playable_cards)));
		
		// End turn if there are no playable cards.
		if (ds_list_size(playable_cards) <= 0) {
			show_debug_message("No cards to play, ending turn.");
		
			with (obj_battle_manager) {
				state_switch("turnEnd");
			}
		
			exit;
		}
		
		// Skip turn to save up on points and cards.
		if (
			ability_points <= 1
			&& ds_list_size(playable_cards) <= 1
			&& irandom(3) == 1
		) {
			show_debug_message("Let's play it safe... skipping turn.");
		
			with (obj_battle_manager) {
				state_switch("turnEnd");
			}
		
			exit;
		}
	
		var card_to_play = scr_choose_from_list(playable_cards);
		show_debug_message("Gonna play " + card_to_play.title);
		ds_queue_enqueue(cards_to_play, card_to_play);
		state_switch("playingCards");
	
		exit;
	}

	_action_delay -= 1;
}