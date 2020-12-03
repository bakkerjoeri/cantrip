function move_card_to_list(card, new_list) {
	var previous_list = card.current_list;
	card.current_list = new_list;
	
	if (scr_does_list_contain_item(new_list, card)) {
		return;
	}

	if (previous_list) {
		scr_move_item_between_lists(card, previous_list, new_list);
	} else {
		ds_list_add(new_list, card);
	}
}