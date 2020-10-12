function scr_card_definition_raise_the_dead(card) {
	card.name = "raise_the_dead";
	card.title = "raise the dead";
	card.cost = 0;
	card.text = "Draw the top card from your graveyard.";
	card.effect = do_raise_the_dead_effect;
	card.condition = can_play_raise_the_dead;
	card.rarity = 1;
}

function do_raise_the_dead_effect(target, source) {
	var card_to_retrieve = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

	if (!card_to_retrieve) {
		return;
	}
	
	with (card_to_retrieve) {
		scr_move_item_between_lists(card_to_retrieve, source.graveyard, source.hand);
		state_switch("beingDrawn");
	}

	scr_add_event_log(source.name + " brings back " + card_to_retrieve.title + " from their graveyard.");
}

function can_play_raise_the_dead(target, source) {
	return ds_list_size(source.graveyard) > 0;
}