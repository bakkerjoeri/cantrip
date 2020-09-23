function scr_card_definition_revenge_from_beyond(card) {
	card.name = "revenge_from_beyond";
	card.title = "revenge from beyond";
	card.cost = 1;
	card.text = "Play the top card from your opponent's graveyard.";
	card.effect = do_revenge_from_beyond_effect;
	card.condition = can_play_revenge_from_beyond;
}

function do_revenge_from_beyond_effect(target, source) {
	var card_to_play = ds_list_find_value(target.graveyard, ds_list_size(target.graveyard) - 1);

	if (card_to_play) {
		ds_list_delete(target.graveyard, ds_list_find_index(target.graveyard, card_to_play));
	
		with (card_to_play) {
			played_by = source;
			state_switch("startPlay");
		}
	}
}

function can_play_revenge_from_beyond(target, source) {
	return ds_list_size(target.graveyard) > 0;
}