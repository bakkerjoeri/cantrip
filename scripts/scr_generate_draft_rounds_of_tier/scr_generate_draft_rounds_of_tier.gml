/// scr_generate_draft_rounds_of_tier(tier);
function scr_generate_draft_rounds_of_tier() {
	var tier = argument[0];
	var cards_to_draft = ds_list_create();
	var draft_rounds_list = ds_list_create();
	var draft_rounds_queue = ds_queue_create();
	
	if (tier == 0) {
		var first_set = scr_get_unique_cards_of_tier(6, 0);
		var second_set = scr_get_unique_cards_of_tier(3, 1);
		
		for (var c = 0; c < 6; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(first_set, c));
		}
		
		for (var c = 0; c < 3; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(second_set, c));
		}
	}

	if (tier == 1) {
		var first_set = scr_get_unique_cards_of_tier(3, 0);
		var second_set = scr_get_unique_cards_of_tier(6, 1);
		
		for (var c = 0; c < 3; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(first_set, c));
		}
		
		for (var c = 0; c < 6; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(second_set, c));
		}
	}

	if (tier == 2) {
		var first_set = scr_get_unique_cards_of_tier(3, 0);
		var second_set = scr_get_unique_cards_of_tier(3, 1);
		var third_set = scr_get_unique_cards_of_tier(3, 2);
		
		for (var c = 0; c < 3; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(first_set, c));
		}
		
		for (var c = 0; c < 3; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(second_set, c));
		}
		
		for (var c = 0; c < 3; c += 1) {
			ds_list_add(cards_to_draft, ds_list_find_value(third_set, c));
		}
	}
	
	ds_list_shuffle(cards_to_draft);
		
	for (var r = 0; r < 3; r += 1) {
		var cards_of_round = ds_list_create();

		for (var c = 0; c < 3; c += 1) {
			ds_list_add(cards_of_round, ds_list_find_value(cards_to_draft, (r * 3) + c));
		}
		
		var draft_round = ds_map_create();
		draft_round[? "cards"] = cards_of_round;

		ds_list_add(draft_rounds_list, draft_round);
	}

	ds_list_shuffle(draft_rounds_list);

	// Convert the list into a queue
	for (var d = 0; d <= ds_list_size(draft_rounds_list) - 1; d += 1) {
		ds_queue_enqueue(draft_rounds_queue, ds_list_find_value(draft_rounds_list, d));
	}

	ds_list_destroy(draft_rounds_list);

	return draft_rounds_queue;


}
