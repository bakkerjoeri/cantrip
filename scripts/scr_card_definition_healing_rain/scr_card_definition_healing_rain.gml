function scr_card_definition_healing_rain(card) {
	card.name = "healing_rain";
	card.title = "healing rain";
	card.cost = 1;
	card.text = "For 3 turns, you draw 1 more card at the start of your turn.";
	card.effect = do_healing_rain_effect;
	card.rarity = 1;
	card.has_priority = check_priority_for_healing_rain;
}

function do_healing_rain_effect(target, source) {
	scr_add_start_of_turn_effect(
		source,
		"healing_rain",
		healing_rain_start_of_turn_effect,
		3,
		false,
	);
	
	scr_add_event_log("Shimmering droplets rain down on " + target.name + ".");
}

function healing_rain_start_of_turn_effect(target, source, turnsLeft) {
	scr_draw_cards(source, 1);
	
	if (turnsLeft == 0) {
		scr_add_event_log(source.name + "feels refreshed. The healing rain dissipates.", 2);
	} else if (turnsLeft == 1) {
		scr_add_event_log(source.name + "feels refreshed. The healing rain has " + string(turnsLeft) + " turn left.", 2);
	} else {
		scr_add_event_log(source.name + "feels refreshed. The healing rain has " + string(turnsLeft) + " turns left.", 2);
	}
}

function check_priority_for_healing_rain() {
	return true;
}