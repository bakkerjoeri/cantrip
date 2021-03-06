function scr_card_definition_necrotic_blast(card) {
	card.name = "necrotic_blast";
	card.title = "necrotic blast";
	card.cost = 1;
	card.text = "Do damage equal to the cost of your graveyard's top card plus 1."
	card.effect = do_necrotic_blast_effect;
	card.condition = can_play_necrotic_blast;
	card.rarity = 1;
	card.has_priority = check_priority_for_necrotic_blast;
}

function do_necrotic_blast_effect(target, source) {
	if (ds_list_size(source.graveyard) == 0) {
		return;
	}
	
	var card = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);
	
	if (!variable_instance_exists(card, "cost")) {
		scr_take_damage(target, 1, source);
	} else {
		scr_take_damage(target, card.cost + 1, source);
	}
	
	scr_add_event_log("A ghoulish blast bursts forth and hits " + target.name);
}

function can_play_necrotic_blast(target, source) {
	if (ds_list_size(source.graveyard) == 0) {
		return false;
	}
	
	return true;
}

function check_priority_for_necrotic_blast(target, source, playable_cards, unplayable_cards, card) {
	if (ds_list_size(source.graveyard) == 0) {
		return false;
	}

	var card_to_check = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);
	
	if (
		variable_instance_exists(card_to_check, "cost")
		&& (card_to_check.cost + 1) >= 2
	) {
		return true;
	}
	
	return false;
}