function scr_card_definition_leech(card) {
	card.name = "leech";
	card.title = "leech";
	card.cost = 1;
	card.text = "Steal 1 card from your foe.";
	card.effect = do_leech_effect;
	card.condition = can_play_leech;
	card.rarity = 1;
}

function do_leech_effect(target, source) {
	var card_to_steal = scr_choose_from_list(target.hand);

	if (!card_to_steal) {
		return;
	}

	scr_move_item_between_lists(card_to_steal, target.hand, source.hand);
		
	with (card_to_steal) {
		owner = source;
		state_switch("beingDrawn");
	}
	
	scr_add_event_log(source.name + " leeches " + target.name + "'s power, stealing " + card_to_steal.title);
}

function can_play_leech(target, source) {
	return ds_list_size(target.hand) > 0;
}