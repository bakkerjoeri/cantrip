function scr_card_definition_forge(card) {
	card.name = "forge";
	card.title = "forge";
	card.cost = 2;
	card.text = "increase damage of \"attack\" cards in your hand by 1.";
	card.effect = do_forge_effect;
	card.condition = can_play_forge;
	card.rarity = 1;
}

function do_forge_effect(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "attack") {
			card.damage += 1;
			card.text = "Do " + string(card.damage) + " damage.";
		}
	}
}

function can_play_forge(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "attack") {
			return true;
		}
	}

	return false;
}