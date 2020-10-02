function scr_card_definition_seance(card) {
	card.name = "seance";
	card.title = "seance";
	card.cost = 1;
	card.text = "Play the top card from your graveyard.";
	card.effect = do_seance_effect;
	card.condition = can_play_seance;
	card.rarity = 3;
}

function do_seance_effect(target, source) {
	var card_to_play = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);

	if (card_to_play) {
		scr_remove_item_from_list(source.graveyard, card_to_play);
		with (card_to_play) {
			played_by = source;
			state_switch("startPlay");
			play_depth = card.depth - 1;
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
	
	if (card_to_play.is_unplayable) {
		return false;
	}
	
	return true;
}