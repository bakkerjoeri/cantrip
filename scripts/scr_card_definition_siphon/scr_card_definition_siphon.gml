function scr_card_definition_siphon(card) {
	card.name = "siphon";
	card.title = "siphon";
	card.cost = 0;
	card.text = "Steal up to 2 AP from your foe.";
	card.effect = do_siphon_effect;
	card.condition = can_play_siphon;
	card.rarity = 1;
}

function do_siphon_effect(target, source) {
	var stolen_ap = min(target.ability_points, 2);

	scr_character_loses_ap(target, stolen_ap)
	scr_character_gains_ap(source, stolen_ap);
}

function can_play_siphon(target, source) {
	return target.ability_points > 0;
}