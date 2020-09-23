function scr_card_definition_leech(card) {
	card.name = "leech";
	card.title = "leech";
	card.cost = 1;
	card.text = "Steal 1 card from your opponent.";
	card.effect = do_leech_effect;
	card.condition = can_play_leech;
}

function do_leech_effect(target, source) {
	var card_to_steal = scr_choose_from_list(target.hand);

	if (card_to_steal) {
		with (card_to_steal) {
			ds_list_delete(target.hand, ds_list_find_index(target.hand, card_to_steal));
			ds_list_add(source.hand, card_to_steal);
			owner = source;
			state_switch("beingDrawn");
		}
	}
}

function can_play_leech(target, source) {
	return ds_list_size(target.hand) > 0;
}