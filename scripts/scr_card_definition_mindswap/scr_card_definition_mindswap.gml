function scr_card_definition_mindswap(card) {
		card.name = "mindswap";
		card.title = "mindswap";
		card.cost = 1;
		card.text = "Switch hands with your foe until your next turn.";
		card.effect = do_mindswap_effect;
		card.rarity = 2;
}

function do_mindswap_effect(target, source) {
	swap_hands(target, source);

	scr_add_start_of_turn_effect(
		source,
		"mindswap",
		end_mind_swap,
		1,
		false,
	);
	
	var r = irandom(2);
	
	if (r == 0) {
		scr_add_event_log(target.name + " is unsure of who they are.");
	} else if (r == 1) {
		scr_add_event_log(target.name + " feels like they're not alone in their head.");
	} else {
		scr_add_event_log(target.name + " feels like their perspective has suddenly shifted.");
	}
}

function end_mind_swap(target, source) {
	swap_hands(target, source);
	
	scr_add_event_log(target.name + " and " + source.name + " return to their own minds. They think.");
}

function swap_hands(target, source) {
	var target_hand = ds_list_create();
	ds_list_copy(target_hand, target.hand);
	var source_hand = ds_list_create();
	ds_list_copy(source_hand, source.hand);

	for (var c = 0; c <= ds_list_size(target_hand) - 1; c += 1) {
		var card_to_swap = ds_list_find_value(target_hand, c);
	
		with (card_to_swap) {
			scr_move_item_between_lists(card_to_swap, target.hand, source.hand);
			owner = source;
			state_switch("beingDrawn");
		}
	}

	for (var c = 0; c <= ds_list_size(source_hand) - 1; c += 1) {
		var card_to_swap = ds_list_find_value(source_hand, c);
	
		with (card_to_swap) {
			scr_move_item_between_lists(card_to_swap, source.hand, target.hand);
			owner = target;
			state_switch("beingDrawn");
		}
	}
}