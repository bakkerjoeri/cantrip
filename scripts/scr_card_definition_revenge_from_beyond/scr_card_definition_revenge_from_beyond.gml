function scr_card_definition_revenge_from_beyond(card) {
	card.name = "revenge_from_beyond";
	card.title = "revenge from beyond";
	card.cost = 1;
	card.text = "Play the top card from your foe's graveyard.";
	card.effect = do_revenge_from_beyond_effect;
	card.condition = can_play_revenge_from_beyond;
	card.rarity = 0;
	card.has_priority = check_priority_for_revenge_from_beyond;
}

function do_revenge_from_beyond_effect(target, source, card) {
	var card_to_play = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (!card_to_play) {
		return;
	}
	
	scr_remove_item_from_list(target.graveyard, card_to_play);

	with (card_to_play) {
		played_by = source;
		state_switch("startPlay");
		play_depth = card.depth - 1;
	}
	
	scr_add_event_log(source.name + " conspires with the spirits against " + target.name + " and plays " + card_to_play.title + " from beyond the veil.");
}

function can_play_revenge_from_beyond(target, source) {
	if (ds_list_size(target.graveyard) == 0) {
		return false;
	}
	
	var card_to_play = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);
	
	if (card_to_play.is_unplayable) {
		return false;
	}
	
	return true;
}

function check_priority_for_revenge_from_beyond(target, source, playable_cards, unplayable_cards, card) {
	var card_to_play = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);
	
	if (card_to_play.name == "revenge_from_beyond" || card_to_play.name == "seance") {
		return false;
	}
	
	if (is_undefined(card_to_play.has_priority)) {
		return false;
	}
	
	return card_to_play.has_priority(target, source, playable_cards, unplayable_cards, card_to_play);
}
