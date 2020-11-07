function scr_character_playing_cards() {
	if (
		!card_being_played
		&& ds_queue_empty(cards_to_play)
	) {
		state_switch_previous();
		exit;
	}

	if (
		!card_being_played
		&& !ds_queue_empty(cards_to_play)
	) {
		card_being_played = ds_queue_dequeue(cards_to_play);
		scr_character_loses_ap(self.id, card_being_played.cost);
	
		with (card_being_played) {
			played_by = other.id;
			state_switch("startPlay");
		}
		
		scr_add_event_log(name + " plays " + card_being_played.title + ".", 1);
		
		if (
			scr_does_list_contain_item(active_effects, "catalyst")
			|| obj_game_manager.perks.forbidden_alchemy
		) {
			amount_of_cards_to_draw += 1;
		}
	
		exit;
	}

	if (
		card_being_played &&
		card_being_played.state_name != "startPlay" &&
		card_being_played.state_name != "beingPlayed" &&
		card_being_played.state_name != "isResolved" &&
		card_being_played.state_name != "beingDiscarded"
	) {
		card_being_played = noone;
		exit;
	}
}
