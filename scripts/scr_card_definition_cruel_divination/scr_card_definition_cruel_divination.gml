function scr_card_definition_cruel_divination(card) {
	card.name = "cruel_divination";
	card.title = "cruel divination";
	card.cost = 1;
	card.text = "Draw a card. Do damage equal to its cost.";
	card.effect = do_cruel_divination_effect;
	card.rarity = 1;
	card.condition = can_play_cruel_divination;
}

function do_cruel_divination_effect(target, source) {
	ds_list_add(source.active_effects, "cruel_divination");
	scr_draw_cards(source, 1);
}

function can_play_cruel_divination(target, source) {
	if (ds_list_empty(source.draw_pile) && ds_list_empty(source.graveyard)) {
		return false;
	}
	
	return true;
}