function scr_card_definition_fireblast(card) {
	card.name = "fireblast";
	card.title = "fireblast";
	card.cost = 2;
	card.text = "Do 3 damage.";
	card.effect = do_fireblast_effect;
}

function do_fireblast_effect(target, source) {
	scr_take_damage(target, 3, source);
}
