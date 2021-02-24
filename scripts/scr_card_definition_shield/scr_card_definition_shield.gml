function scr_card_definition_shield(card) {
	card.name = "shield";
	card.title = "shield";
	card.is_unplayable = true;
	card.discard_priority = 2;
	card.damage = 0;
	card.text = get_shield_card_text(card);
	card.rarity = 0;
}

function get_shield_card_text(card) {
	if (card.damage > 0) {
		return "This always gets hit first. When hit by your foe, do " + string(card.damage) + " damage.";
	}
	
	return "This always gets hit first.";
}