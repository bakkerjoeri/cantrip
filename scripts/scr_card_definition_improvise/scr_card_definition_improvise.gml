function scr_card_definition_improvise(card) {
	card.name = "improvise";
	card.title = "improvise";
	card.cost = 1;
	card.text = "Play the top card of your draw pile.";
	card.effect = do_improvise_effect;
	card.rarity = 1;
	card.condition = can_play_improvise;
}

function do_improvise_effect(target, source, card) {
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
	
	scr_add_event_log(source.name + " comes up with " + card_to_play.title + ".");
}

function can_play_improvise(target, source) {
	if (ds_list_empty(source.draw_pile)) {
		return false;
	}
	
	return true;
}