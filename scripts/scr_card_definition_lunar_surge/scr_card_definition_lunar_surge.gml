function scr_card_definition_lunar_surge(card) {
	card.name = "lunar_surge";
	card.title = "lunar surge";
	card.cost = 1;
	card.text = "Until next turn, your cards cost 1 less.";
	card.effect = do_lunar_surge_effect;
	card.rarity = 2;
	card.has_priority = check_priority_for_lunar_surge;
}

function do_lunar_surge_effect(target, source, card) {
	if (!variable_instance_exists(source, "lunar_surged_cards")) {
		source.lunar_surged_cards = ds_list_create();
	}

	with (obj_card_base) {
		var affected_card = self.id;

		if (
			affected_card.owner == source
			&& variable_instance_exists(affected_card, "cost")
			&& affected_card.cost >= 1
		) {
			affected_card.cost -= 1;
			ds_list_add(source.lunar_surged_cards, affected_card);
		}
	}

	scr_add_start_of_turn_effect(source, "lunar_surge", end_lunar_surge, 1, true);
	
	scr_add_event_log(source.name + " calls upon the power of the moon. A brilliant shimmer surrounds them, and start to feel light.");
}

function end_lunar_surge(target, source) {
	for (var c = 0; c <= ds_list_size(source.lunar_surged_cards) - 1; c += 1) {
		var card = ds_list_find_value(source.lunar_surged_cards, c);
		
		if (instance_exists(card) && variable_instance_exists(card, "cost")) {
			card.cost += 1;
		}
	}
	
	scr_make_list_empty(source.lunar_surged_cards);
	
	scr_add_event_log("The brilliance surrounding " + source.name + " fades. The lunar surge wears off.", 2);
}

function check_priority_for_lunar_surge(target, source, playable_cards, unplayable_cards, card) {
	return true;
}