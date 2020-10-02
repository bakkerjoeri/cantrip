function scr_card_definition_riposte(card) {
	card.name = "riposte";
	card.title = "riposte";
	card.text = "When hit, play the top card of your draw pile.";
	card.is_unplayable = true;
	card.counter = do_riposte;
	card.rarity = 0;
}

function do_riposte(target, source) {
	if (ds_list_empty(source.draw_pile)) {
		return;
	}

	var card_to_play = ds_list_find_value(source.draw_pile, ds_list_size(source.draw_pile) - 1);

	scr_remove_item_from_list(source.draw_pile, card_to_play);
	
	with (card_to_play) {
		played_by = source;
		state_switch("startPlay");
		play_depth = card.depth - 1;
	}
}