function scr_card_definition_blood_rites(card) {
	card.name = "blood_rites";
	card.title = "blood rites";
	card.cost = 2;
	card.text = "Destroy your hand. Reduce your hand size by 1. Draw until your hand is full.";
	card.effect = do_blood_rites_effect;
	card.rarity = 2;
	card.has_priority = should_play_blood_rites;
}

function do_blood_rites_effect(target, source) {
	do_damage_effect();

	with (obj_screen_manager) {
		shake = 12;
	}
	
	var cards_to_destroy = scr_clone_list(source.hand);
	
	for (var c = 0; c <= ds_list_size(cards_to_destroy) - 1; c += 1) {
		var card_to_destroy = ds_list_find_value(cards_to_destroy, c);

		with (card_to_destroy) {
			state_switch("destroyed");
		}	
	}
	
	scr_make_list_empty(source.hand);

	source.max_hand_size = max(0, source.max_hand_size - 1);
	scr_draw_cards(source, source.max_hand_size - ds_list_size(source.hand));
	audio_play_sound(heartbeat, 1, false);
	scr_add_event_log("Red mist gathers around " + source.name + ". They feel rejuvenated, but a hollowness remains.");
}

function should_play_blood_rites(target, source) {
	if (ds_list_size(source.hand) <= 3) {
		return true;
	}
	
	return false;
}