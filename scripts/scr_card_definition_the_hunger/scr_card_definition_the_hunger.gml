function scr_card_definition_the_hunger(card) {
	card.name = "the_hunger";
	card.title = "the hunger";
	card.cost = 2;
	card.damage = 1;
	card.text = get_the_hunger_text(card.damage);
	card.effect = do_the_hunger_effect;
	card.on_turn_end = the_hunger_on_end_of_turn;
	card.on_discard = the_hunger_on_discard;
	card.rarity = 2;
	card.has_priority = check_priority_for_the_hunger;
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
	return  "Do " + string(damage) + " damage. At the end of your turn, increase damage by 1.";
}

function check_priority_for_the_hunger(target, source, playable_cards, unplayable_cards, card) {
	if (card.damage >= 4) {
		return true;
	}
	
	return false;
}