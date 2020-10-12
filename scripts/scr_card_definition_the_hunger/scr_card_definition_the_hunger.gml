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
	
	scr_add_event_log("Darkness opens its maws and engulfs " + target.name + ".");
}

function the_hunger_on_end_of_turn(target, source, card) {
	card.damage += 1;
	card.text = get_the_hunger_text(card.damage);
	
	var r = irandom(3);
	
	if (r == 0 && card.is_face_up) {
		scr_add_event_log("The void begs for sustenance. The hunger's damage increases by 1.");
	} else if (r == 1 && card.is_face_up) {
		scr_add_event_log("Voices moan from beyond. The hunger's damage increases by 1.");
	} else if (r == 2 && card.is_face_up) {
		scr_add_event_log("Something is approaching... The hunger's damage increases by 1.");
	} else if (r == 3 && card.is_face_up) {
		scr_add_event_log("Mouths... So many mouths to feed. The hunger's damage increases by 1.");
	}
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