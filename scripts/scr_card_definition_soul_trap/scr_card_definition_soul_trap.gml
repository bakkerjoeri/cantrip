function scr_card_definition_soul_trap(card) {
	card.name = "soul_trap";
	card.title = "soul trap";
	card.text = "When hit, steal all your foe's AP and gain 1 more.";
	card.is_unplayable = true;
	card.counter = do_soul_trap;
	card.rarity = 1;
}

function do_soul_trap(target, source, card) {
	var stolen_ap = target.ability_points;
	scr_character_loses_ap(target, stolen_ap);
	scr_character_gains_ap(source, stolen_ap + 1);
	
	scr_add_event_log("Purple mist erupts around " + target.name + ". " + source.name + " siphons all AP from them, and now has " + string(stolen_ap + 1) + " AP.");
}