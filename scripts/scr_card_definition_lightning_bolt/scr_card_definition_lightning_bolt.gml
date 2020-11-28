function scr_card_definition_lightning_bolt(card) {
	card.name = "lightning_bolt";
	card.title = "lightning bolt";
	card.cost = 2;
	card.text = "Do 1 damage, then damage all cards with the same cost as the card that was hit.";
	card.effect = do_lightning_bolt_effect;
	card.rarity = 2;
	card.has_priority = check_priority_for_lightning_bolt;
}

function do_lightning_bolt_effect(target, source, card) {
	if (ds_list_size(target.hand) == 0) {
		scr_take_damage(target, 1, source);
		return;
	}

	var chosen_card = scr_choose_from_list(target.hand);
	var chosen_card_has_cost = variable_instance_exists(chosen_card, "cost");
	var damaged_cards = ds_list_create();
	
	for (var c = 0; c <= ds_list_size(target.hand) - 1; c += 1) {
		var current_card = ds_list_find_value(target.hand, c);
		
		if (
			(chosen_card_has_cost && variable_instance_exists(current_card, "cost") && current_card.cost == chosen_card.cost) ||
			(!chosen_card_has_cost && !variable_instance_exists(current_card, "cost"))
		) {
			ds_list_add(damaged_cards, current_card);
		}
	}
	
	var damage = ds_list_size(damaged_cards);
	
	scr_take_damage(target, damage, source, {
		cards: scr_create_array_from_list(damaged_cards),
	});
	
	if (damage <= 2) {
		scr_add_event_log(source.name + " shoots a bolt of lightning through " + target.name + ".");
	} else if (damage <= 4) {
		scr_add_event_log("Lightning emanates from " + source.name + " and surrounds " + target.name + " before striking into them with a sudden jolt.");
	} else {
		scr_add_event_log("The sky darkens, and with a sudden clap of thunder, " + source.name + " unleashes a cascade of lightning onto " + target.name + "!");
	}
	
	ds_list_destroy(damaged_cards);
}

function check_priority_for_lightning_bolt() {
	return true;
}