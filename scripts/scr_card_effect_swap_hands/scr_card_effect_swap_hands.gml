/// scr_card_effect_swap_hands(target, source);
function scr_card_effect_swap_hands() {
	var target = argument[0];
	var source = argument[1];

	var target_hand = ds_list_create();
	ds_list_copy(target_hand, target.hand);
	var source_hand = ds_list_create();
	ds_list_copy(source_hand, source.hand);

	for (var c = 0; c <= ds_list_size(target_hand) - 1; c += 1) {
		var card_to_swap = ds_list_find_value(target_hand, c);
	
		with (card_to_swap) {
			ds_list_delete(target.hand, ds_list_find_index(target.hand, card_to_swap));
			ds_list_add(source.hand, card_to_swap);
			owner = source;
			state_switch("beingDrawn");
		}
	}

	for (var c = 0; c <= ds_list_size(source_hand) - 1; c += 1) {
		var card_to_swap = ds_list_find_value(source_hand, c);
	
		with (card_to_swap) {
			ds_list_delete(source.hand, ds_list_find_index(source.hand, card_to_swap));
			ds_list_add(target.hand, card_to_swap);
			owner = target;
			state_switch("beingDrawn");
		}
	}


}
