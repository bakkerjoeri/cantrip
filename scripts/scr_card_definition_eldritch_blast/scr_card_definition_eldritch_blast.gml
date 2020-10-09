function scr_card_definition_eldritch_blast(card) {
	card.name = "eldritch_blast";
	card.title = "eldritch blast";
	card.cost = 2;
	card.text = "Do 2 damage, steal 1 AP.";
	card.effect = do_eldritch_blast_effect;
	card.rarity = 3;
	card.has_priority = check_priority_for_eldritch_blast;
}

function do_eldritch_blast_effect(target, source) {
	scr_take_damage(target, 2, source);
	
	var stolen_ap = min(target.ability_points, 1);

	scr_character_loses_ap(target, stolen_ap);
	scr_character_gains_ap(source, stolen_ap);
}

function check_priority_for_eldritch_blast() {
	return true;
}