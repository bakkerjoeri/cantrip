function scr_card_definition_the_hunger(card) {
	card.name = "the_hunger";
	card.title = "the hunger";
	card.cost = 2;
	card.damage = 1;
	card.text = get_the_hunger_text(card.damage);
	card.effect = do_the_hunger_effect;
	card.on_turn_end = the_hunger_on_end_of_turn;
	card.on_discard = the_hunger_on_discard
}

function do_the_hunger_effect(target, source, card) {
	scr_take_damage(target, card.damage, source);
}

function the_hunger_on_end_of_turn(target, source, card) {
	card.damage += 1;
	card.text = get_the_hunger_text(card.damage);
}

function the_hunger_on_discard(target, source, card) {
	card.damage = 1;
	card.text = get_the_hunger_text(card.damage);
}

function get_the_hunger_text(damage) {
	return  "Do " + string(damage) + " damage. Damage increases by 1 at the end of your turn.";
}