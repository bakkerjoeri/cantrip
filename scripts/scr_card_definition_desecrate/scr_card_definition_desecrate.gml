function scr_card_definition_desecrate(card) {
	card.name = "desecrate";
	card.title = "desecrate";
	card.cost = 0;
	card.text = "Steal the top card from your opponent's graveyard.";
	card.effect = do_desecrate_effect;
	card.condition = can_play_desecrate;
	card.rarity = 0;
}

function do_desecrate_effect(target, source) {
	var card_to_steal = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (card_to_steal) {	
		with (card_to_steal) {
			scr_move_item_between_lists(card_to_steal, target.graveyard, source.hand);
			owner = source;
			state_switch("beingDrawn");
		}
	}
}

function can_play_desecrate(target) {
	return ds_list_size(target.graveyard) > 0;
}