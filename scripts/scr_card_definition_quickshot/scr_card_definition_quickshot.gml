function scr_card_definition_quickshot(card) {
	card.name = "quickshot";
	card.title = "quickshot";
	card.cost = 0;
	card.text = "Do 1 damage. Ineffective against \"shield\" cards.";
	card.effect = do_quickshot_effect;
	card.damage = 1;
	card.rarity = 1;
}

function do_quickshot_effect(target, source, card) {
	scr_take_damage(target, card.damage, source, {
		deflected_by_shields: true,
	});
	
	scr_add_event_log("Suddenly, an arrow flies in " + target.name + "'s direction!");
}
