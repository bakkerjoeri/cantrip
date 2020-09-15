function scr_card_definition_necrotic_blast() {
	var definition = {
		name: "necrotic_blast",
		title: "necrotic blast",
		cost: 1,
		text: "Do 1 damage plus the cost of your graveyard's top card.",
		effect: do_necrotic_blast_effect,
		condition: can_play_necrotic_blast,
	}
	
	return definition;
}

function do_necrotic_blast_effect(target, source) {
	if (ds_list_size(source.graveyard) == 0) {
		return;
	}
	
	var card = ds_list_find_value(source.graveyard, ds_list_size(source.graveyard) - 1);
	
	if (!variable_instance_exists(card, "cost")) {
		scr_take_damage(target, 1, source);
	}

	scr_take_damage(target, card.cost + 1, source);
}

function can_play_necrotic_blast(target, source) {
	if (ds_list_size(source.graveyard) == 0) {
		return false;
	}
	
	return true;
}