function scr_card_definition_plague_bomb(card) {
	card.name = "plague_bomb";
	card.title = "plague bomb";
	card.cost = 1;
	card.damage = 1;
	card.text = get_plague_bomb_text(card.damage);
	card.effect = do_plague_bomb_effect;
	card.counter = plague_bomb_explodes;
	card.on_turn_end = plague_bomb_on_end_of_turn;
	card.on_discard = plague_bomb_on_discard;
	card.rarity = 3;
	card.has_priority = check_priority_for_plague_bomb;
}

function do_plague_bomb_effect(target, source, card) {
	with (card) {
		move_card_to_list(self.id, target.hand);
		owner = target;
		state_switch("beingDrawn");
	}
	
	scr_add_event_log(source.name + " gives the acrid smelling bomb to " + target.name);
}

function plague_bomb_explodes(target, source, card) {
	scr_take_damage(source, card.damage, source);
	
	if (card.damage <= 1) {
		scr_add_event_log("The plague bomb goes off and hits " + source.name + " with a hollow bang.");
	} else if (card.damage <= 3) {
		scr_add_event_log(source.name + " is blinded by a flash of green as the plague bomb explodes with a loud bang.");
	} else {
		scr_add_event_log("A cascade of green flashes and sparks erupts from the plague bomb, swallowing up " + source.name + " in an ear splitting explosion!");
	}
}

function plague_bomb_on_end_of_turn(target, source, card) {
	card.damage += 1;
	card.text = get_plague_bomb_text(card.damage);
}

function plague_bomb_on_discard(target, source, card) {
	card.damage = 1;
	card.text = get_plague_bomb_text(card.damage);
}

function get_plague_bomb_text(damage) {
	return  "Give to your foe. When hit, take " + string(damage) + " damage. Each turn, increase damage by 1.";
}

function check_priority_for_plague_bomb(target, source, playable_cards, unplayable_cards, card) {
	if (ds_list_size(source.hand) <= card.damage) {
		return true;
	}
	
	if (card.damage >= 3) {
		return true;
	}
	
	return false;
}