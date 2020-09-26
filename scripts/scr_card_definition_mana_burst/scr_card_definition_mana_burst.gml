function scr_card_definition_mana_burst(card) {
	card.name = "mana_burst";
	card.title = "mana burst";
	card.cost = 0;
	card.text = "Do damage equal to your AP.";
	card.effect = do_mana_burst_effect;
	card.condition = can_play_mana_burst;
	card.rarity = 2;
}

function do_mana_burst_effect(target, source) {
	scr_take_damage(target, source.ability_points, source);
}

function can_play_mana_burst(target, source) {
	return source.ability_points > 0;
}