function scr_card_definition_the_hunger(card) {
	card.name = "the_hunger";
	card.title = "the hunger";
	card.cost = 3;
	card.text = "Do 1 damage.\n\nAt the end of your turn, damage increases by 1.";
	card.effect = do_the_hunger_effect;
}

function do_the_hunger_effect(target, source, card) {
	scr_take_damage(target, card.damage, source);
}
