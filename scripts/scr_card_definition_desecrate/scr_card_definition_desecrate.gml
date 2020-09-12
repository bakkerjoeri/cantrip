function scr_card_definition_desecrate() {
	var definition = {
		name: "desecrate",
		title: "desecrate",
		cost: 0,
		text: "Steal the top card from your opponent's graveyard.",
		effect: do_desecrate_effect,
		condition: can_play_desecrate,
	};
	
	return definition
}

function do_desecrate_effect(target, source) {
	var card_to_steal = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (card_to_steal) {	
		with (card_to_steal) {
			ds_list_delete(target.graveyard, ds_list_find_index(target.graveyard, card_to_steal));
			ds_list_add(source.hand, card_to_steal);
			owner = source;
			state_switch("beingDrawn");
		}
	}
}

function can_play_desecrate(target) {
	return ds_list_size(target.graveyard) > 0;
}