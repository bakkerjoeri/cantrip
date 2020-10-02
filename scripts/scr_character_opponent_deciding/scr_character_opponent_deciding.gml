function scr_character_opponent_deciding() {
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
			
				if (scr_can_character_play_card(self.id, card_to_check)) {
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
			
			// If one of the playable cards is burning, it should get priority
			var burning_cards = ds_list_create();
			
			for (var c = 0; c <= ds_list_size(playable_cards) - 1; c += 1) {
				var card_to_check = ds_list_find_value(playable_cards, c);
			
				if (card_to_check.is_burning) {
					ds_list_add(burning_cards, card_to_check);
				}
			}

			// Sometimes skip turn to save up on points and cards.
			if (
				ds_list_size(burning_cards) == 0
				&& (ability_points <= 1 || ds_list_size(playable_cards) <= 1)
				&& irandom(9) == 1
			) {
				show_debug_message("Let's play it safe... skipping turn.");
		
				with (obj_battle_manager) {
					state_switch("turnEnd");
				}
		
				exit;
			}
	
			var card_to_play;
			
			if (ds_list_size(burning_cards) > 0 && irandom(4) != 1) {
				card_to_play = scr_choose_from_list(burning_cards);
				show_debug_message("Found a burning card! Gonna play " + card_to_play.title);
			} else {
				card_to_play = scr_choose_from_list(playable_cards);
				show_debug_message("Gonna play " + card_to_play.title);
			}

			ds_queue_enqueue(cards_to_play, card_to_play);
			state_switch("playingCards");
	
			exit;
		}

		_action_delay -= 1;
	}
}
