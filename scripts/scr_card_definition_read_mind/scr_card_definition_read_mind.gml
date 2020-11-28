function scr_card_definition_read_mind(card) {
	card.name = "read_mind";
	card.title = "read mind";
	card.cost = 1;
	card.text = "Copy up to 2 random cards from your foe's hand.";
	card.effect = do_read_mind_effect;
	card.condition = can_play_read_mind;
	card.rarity = 1;
	card.has_priority = check_priority_for_read_mind;
}

function do_read_mind_effect(target, source) {
	if (ds_list_size(target.hand) == 0) {
		return;
	}
	
	var cards_to_copy = ds_list_create();
	var hand_clone = scr_clone_list(target.hand);
	
	while (
		ds_list_size(hand_clone) > 0
		&& ds_list_size(cards_to_copy) < 2
		&& (ds_list_size(source.hand) + ds_list_size(cards_to_copy)) < source.max_hand_size
	) {
		var card_to_copy = scr_choose_from_list(hand_clone);
		scr_move_item_between_lists(card_to_copy, hand_clone, cards_to_copy);
	}
	
	for (var c = 0; c <= ds_list_size(cards_to_copy) - 1; c += 1) {
		var card_to_copy = ds_list_find_value(cards_to_copy, c);
		var copied_card = scr_create_card(card_to_copy.name);
		ds_list_add(source.hand, copied_card);
	
		with (copied_card) {
			x = (room_width / 2) - 32;
			y = (room_height / 2) - 48;
			owner = source;
			state_switch("beingDrawn");
		}
		
		if (source.is_hand_visible) {
			scr_add_event_log(source.name + " learns about " + card_to_copy.title + ".");
		}
	}
}

function can_play_read_mind(target, source) {
	return ds_list_size(target.hand) > 0;
}

function check_priority_for_read_mind(target, source) {
	var amount_of_cards_to_copy = ds_list_size(target.hand);
	var space_in_hand = source.max_hand_size - ds_list_size(source.hand);
	
	if (amount_of_cards_to_copy >= 2 && space_in_hand >= 1) {
		return true;
	}
	
	return false;
}