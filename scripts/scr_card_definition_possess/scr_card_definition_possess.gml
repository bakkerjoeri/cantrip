function scr_card_definition_possess(card) {
	card.name = "possess";
	card.title = "possess";
	card.cost = 0;
	card.text = "Play a random card in your foe's hand.";
	card.effect = do_possess_effect;
	card.condition = can_play_possess;
	card.rarity = 3;
}

function do_possess_effect(target, source, card) {
	var card_to_play = scr_choose_from_list(target.hand);

	if (!card_to_play) {
		return;
	}
	
	scr_remove_item_from_list(target.hand, card_to_play);
	with (card_to_play) {
		played_by = source;
		state_switch("startPlay");
		play_depth = card.depth - 1;
	}
		
	scr_add_event_log(source.name + " possesses " + target.name + " and plays " + card_to_play.title);
}

function can_play_possess(target, source) {
	if (ds_list_size(target.hand) == 0) {
		return false;
	}
	
	return true;
}