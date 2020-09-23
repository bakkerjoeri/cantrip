function scr_card_definition_raise_the_dead(card) {
	card.name = "raise_the_dead";
	card.title = "raise the dead";
	card.cost = 0;
	card.text = "Draw the top card from your graveyard.";
	card.effect = do_raise_the_dead_effect;
	card.condition = can_play_raise_the_dead;
}

function do_raise_the_dead_effect(target, source) {
	var card_to_retrieve = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

	if (card_to_retrieve) {	
		with (card_to_retrieve) {
			ds_list_delete(source.graveyard, ds_list_find_index(source.graveyard, card_to_retrieve));
			ds_list_add(source.hand, card_to_retrieve);
			state_switch("beingDrawn");
		}
	}
}

function can_play_raise_the_dead(target, source) {
	return ds_list_size(source.graveyard) > 0;
}