function scr_card_definition_revenge_from_beyond(card) {
	card.name = "revenge_from_beyond";
	card.title = "revenge from beyond";
	card.cost = 1;
	card.text = "Play the top card from your foe's graveyard.";
	card.effect = do_revenge_from_beyond_effect;
	card.condition = can_play_revenge_from_beyond;
	card.rarity = 0;
}

function do_revenge_from_beyond_effect(target, source) {
	var card_to_play = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (card_to_play) {
		scr_remove_item_from_list(target.graveyard, card_to_play);

		with (card_to_play) {
			played_by = source;
			state_switch("startPlay");
			play_depth = card.depth - 1;
		}
	}
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