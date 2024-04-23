function scr_card_definition_pickpocket(card) {
	card.name = "pickpocket";
	card.title = "pickpocket";
	card.cost = 0;
	card.text = "Steal the top card from your foe's draw pile.";
	card.effect = do_pickpocket_effect;
	card.condition = can_play_pickpocket;
	card.rarity = 0;
}

function do_pickpocket_effect(target, source, card) {
	if (ds_list_empty(target.draw_pile)) {
		return;
	}

	var card_to_steal = ds_list_find_value(target.draw_pile, ds_list_size(target.draw_pile) - 1);

	if (!card_to_steal) {
		return;
	}

	with (card_to_steal) {
		scr_move_item_between_lists(card_to_steal, target.draw_pile, source.hand);
		owner = source;
		state_switch("beingDrawn");
	}
	
	if (card_to_steal.is_face_up || source.is_hand_visible) {
		scr_add_event_log(source.name + " manages to pilfer " + target.name + "'s pockets and steals " + card_to_steal.title + ".");
	} else {
		scr_add_event_log(source.name + " manages to pilfer " + target.name + "'s pockets and steals a card.");
	}
}

function can_play_pickpocket(target, source) {
	if (ds_list_empty(target.draw_pile)) {
		return false;
	}
	
	return true;
}