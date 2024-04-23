function scr_card_definition_desecrate(card) {
	card.name = "desecrate";
	card.title = "desecrate";
	card.cost = 0;
	card.text = "Steal the top card from your foe's graveyard.";
	card.effect = do_desecrate_effect;
	card.condition = can_play_desecrate;
	card.rarity = 0;
}

function do_desecrate_effect(target, source) {
	var card_to_steal = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (!card_to_steal) {
		return;
	}

	with (card_to_steal) {
		scr_move_item_between_lists(card_to_steal, target.graveyard, source.hand);
		owner = source;
		state_switch("beingDrawn");
	}
	
	scr_add_event_log(source.name + " robs " + target.name + "'s graveyard and steals " + card_to_steal.title + ".");
}

function can_play_desecrate(target) {
	return ds_list_size(target.graveyard) > 0;
}