function scr_card_definition_healing_potion(card) {
	card.name = "healing_potion";
	card.title = "healing potion";
	card.cost = 2;
	card.text = "Draw 3 cards.";
	card.effect = do_healing_potion_effect;
	card.condition = can_play_healing_potion;
}

function do_healing_potion_effect(target, source) {
	with (source) {
		amount_of_cards_to_draw += 3;
		state_switch("drawingCards");
	}
}

function can_play_healing_potion(target, source) {
	return ds_list_size(source.draw_pile) > 0 || ds_list_size(source.graveyard) > 0;
}