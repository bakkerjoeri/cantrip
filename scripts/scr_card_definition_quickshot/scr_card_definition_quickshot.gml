function scr_card_definition_quickshot(card) {
	card.name = "quickshot";
	card.title = "quickshot";
	card.cost = 0;
	card.text = "Do 1 damage. Ineffective against \"shield\" cards.";
	card.effect = do_quickshot_effect;
	card.damage = 1;
	card.rarity = 3;
}

function do_quickshot_effect(target, source, card) {
	scr_take_damage(target, card.damage, source, {
		deflected_by_shields: true,
	});
}
