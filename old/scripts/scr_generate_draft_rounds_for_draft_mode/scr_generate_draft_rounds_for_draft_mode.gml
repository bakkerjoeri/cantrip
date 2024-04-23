function scr_generate_draft_rounds_for_draft_mode() {
	var cards_per_round = 3;
	var cards_to_draft = ds_list_create();
	var draft_rounds_list = ds_list_create();
	var draft_rounds_queue = ds_queue_create();
	
	cards_to_draft = scr_concat_lists(
		scr_get_unique_cards_of_tier(26, 0),
		scr_get_unique_cards_of_tier(22, 1),
		scr_get_unique_cards_of_tier(16, 2),
		scr_get_unique_cards_of_tier(8, 3)
	);
	
	ds_list_shuffle(cards_to_draft);
		
	for (var r = 0; r < (ds_list_size(cards_to_draft) / cards_per_round); r += 1) {
		var cards_of_round = ds_list_create();

		for (var c = 0; c < cards_per_round; c += 1) {
			ds_list_add(cards_of_round, ds_list_find_value(cards_to_draft, (r * cards_per_round) + c));
		}
		
		var draft_round = ds_map_create();
		draft_round[? "cards"] = cards_of_round;

		ds_list_add(draft_rounds_list, draft_round);
	}
	
	ds_list_destroy(cards_to_draft);
	ds_list_shuffle(draft_rounds_list);

	// Convert the list into a queue
	for (var d = 0; d <= ds_list_size(draft_rounds_list) - 1; d += 1) {
		ds_queue_enqueue(draft_rounds_queue, ds_list_find_value(draft_rounds_list, d));
	}

	ds_list_destroy(draft_rounds_list);

	return draft_rounds_queue;
}
