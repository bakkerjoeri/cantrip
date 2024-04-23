function scr_card_definition_piercing_strike(card) {
	card.name = "piercing_strike";
	card.title = "piercing strike";
	card.cost = 1;
	card.text = "Do 1 damage. If it hits a \"shield\" card, do 1 more.";
	card.effect = do_piercing_strike_effect;
	card.rarity = 3;
}

function do_piercing_strike_effect(target, source, card) {
	scr_take_damage(target, 1, source, {
		is_piercing: true,
	});
}
