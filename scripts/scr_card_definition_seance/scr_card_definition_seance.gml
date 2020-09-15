function scr_card_definition_seance() {
	var definition = {
		name: "seance",
		title: "seance",
		cost: 1,
		text: "Play the top card from your graveyard.",
		effect: do_seance_effect,
		condition: can_play_seance,
	}
	
	return definition;
}

function do_seance_effect(target, source) {
	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

	if (card_to_play) {
		ds_list_delete(source.graveyard, ds_list_find_index(source.graveyard, card_to_play));
		with (card_to_play) {
			played_by = source;
			state_switch("startPlay");
		}
	}
}

function can_play_seance(target, source) {
	if (ds_list_size(source.graveyard) == 0) {
		return false;
	}
	
	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);
	
	if (card_to_play.name == "seance") {
		return false;
	}
	
	return true;
}