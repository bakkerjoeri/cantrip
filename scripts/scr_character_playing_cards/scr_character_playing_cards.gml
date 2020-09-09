function scr_character_playing_cards() {
	if (state_new) {
		_after_play_delay = 0;
	}

	if (_after_play_delay == 0 && !card_being_played) {
		if (ds_queue_empty(cards_to_play)) {
			state_switch_previous();
			exit;
		}
	
		card_being_played = ds_queue_dequeue(cards_to_play);
		scr_character_loses_ap(self, card_being_played.cost);
	
		with (card_being_played) {
			state_switch("startPlay");
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
		_after_play_delay = 0.5 * room_speed;
		exit;
	}

	_after_play_delay -= 1;


}
