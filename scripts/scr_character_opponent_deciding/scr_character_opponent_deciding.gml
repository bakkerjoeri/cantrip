function scr_character_opponent_deciding() {
	if (obj_battle_manager.state_name != "turnPlayPhase") {
		return;
	}
	
	if (ds_list_size(hand) == 0 && ds_list_size(draw_pile) == 0 && ds_list_size(graveyard) == 0) {
		if (name == "Adventurer") {
			scr_add_event_log("\"Alright, we'll call it a draw!\" the adventurer posits, and runs off.");
		} else {
			scr_add_event_log(name + " realises they've been bested, and concede.");
		}

		state_switch_previous();

		with (obj_battle_manager) {
			character_that_lost = self.id;
			state_switch("end");
		}
		
		exit;
	}
	
	if (state_new) {
		var playable_cards = get_playable_cards(self.id);
			
		if (ds_list_size(playable_cards) <= 0) {
			show_debug_message("No cards to play, ending turn.");
		
			with (obj_battle_manager) {
				state_switch("turnEnd");
			}
		
			exit;
		}

		show_debug_message("Opponent is deciding what to do next...");
			
		_action_delay = (0.5 + random(1)) * room_speed;
	}

	if (_action_delay <= 0) {
		show_debug_message("Looking for playable cards...");
		// Find all playable cards.
		var playable_cards = get_playable_cards(self.id);
		var unplayable_cards = get_unplayable_cards(self.id);

		show_debug_message("Amount of playable cards: " + string(ds_list_size(playable_cards)));
		
		// End turn if there are no playable cards.
		if (ds_list_size(playable_cards) <= 0) {
			show_debug_message("No cards to play, ending turn.");
		
			with (obj_battle_manager) {
				state_switch("turnEnd");
			}
		
			exit;
		}
			
		// If you die playing Combust, do not!
		if (
			ds_list_size(hand) == 1
			&& ds_list_size(playable_cards) == 1
			&& ds_list_find_value(hand, 0).name == "combust"
		) {
			show_debug_message("That would kill me, ending turn.");
		
			with (obj_battle_manager) {
				state_switch("turnEnd");
			}
		
			exit;
		}
			
		// If one of the playable cards is burning, it should get priority
		var priority_cards = ds_list_create();
			
		for (var c = 0; c <= ds_list_size(playable_cards) - 1; c += 1) {
			var card_to_check = ds_list_find_value(playable_cards, c);
			
			if (card_to_check.is_burning) {
				ds_list_add(priority_cards, card_to_check);
				continue;
			}
				
			if (!is_undefined(card_to_check.has_priority)) {
				var source = self.id;
				var target = scr_get_opponent_of_character(source);
				var has_priority = script_execute(
					card_to_check.has_priority,
					target,
					source,
					playable_cards,
					unplayable_cards,
					card_to_check,
				);
					
				if (has_priority) {
					ds_list_add(priority_cards, card_to_check);
					continue;
				}
			}
		}

		// Sometimes skip turn to save up on points and cards.
		if (
			ds_list_size(priority_cards) == 0
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
			
		if (ds_list_size(priority_cards)) {
			card_to_play = scr_choose_from_list(priority_cards);
			show_debug_message("Found a card with priority! Gonna play " + card_to_play.title);
		} else {
			card_to_play = scr_choose_from_list(playable_cards);
			show_debug_message("Picking at random. Gonna play " + card_to_play.title);
		}

		ds_queue_enqueue(cards_to_play, card_to_play);
		state_switch("playingCards");
	
		exit;
	}

	_action_delay -= 1;
}

function get_playable_cards(character) {
	var playable_cards = ds_list_create();
		
	for (var c = 0; c <= ds_list_size(character.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(character.hand, c);
		
		if (card_to_check.name == "quickshot" && character.does_opponent_have_shields) {
			continue;
		}

		if (scr_can_character_play_card(character, card_to_check)) {
			ds_list_add(playable_cards, card_to_check);
		}
	}
	
	return playable_cards;
}

function get_unplayable_cards(character) {
	var unplayable_cards = ds_list_create();
		
	for (var c = 0; c <= ds_list_size(character.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(character.hand, c);

		if (!scr_can_character_play_card(character, card_to_check)) {
			ds_list_add(unplayable_cards, card_to_check);
		}
	}
	
	return unplayable_cards;
}