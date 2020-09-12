function scr_create_card(card_name) {
	var card_definition_map = scr_get_card_definition_map();
	var card;
		
	if (ds_map_exists(card_definition_map, card_name)) {
		var card_definition = ds_map_find_value(card_definition_map, card_name);
		card = create_card_from_definition(card_definition);
	} else {
		card = create_card_with_instance(card_name);
	}
	
	return card;
}

function create_card_with_instance(card_name) {
	var card
	var card = instance_create_layer(0, 0, "Instances", asset_get_index("obj_card_" + card_name));
	
	return card;
}

function create_card_from_definition(card_definition) {
	var card = instance_create_layer(0, 0, "Instances", obj_card_base);
	
	card.name = card_definition.name;
	card.title = card_definition.title;
	card.text = card_definition.text;

	if (variable_struct_exists(card_definition, "cost")) {
		card.cost = card_definition.cost;
	}

	if (variable_struct_exists(card_definition, "effect")) {
		card.effect = card_definition.effect;
	}
	
	if (variable_struct_exists(card_definition, "counter")) {
		card.counter = card_definition.counter;
	}
	
	if (variable_struct_exists(card_definition, "condition")) {
		card.condition = card_definition.condition;
	}
	
	if (variable_struct_exists(card_definition, "is_unplayable")) {
		card.is_unplayable = card_definition.is_unplayable;
	}
	
	if (variable_struct_exists(card_definition, "discard_priority")) {
		card.discard_priority = card_definition.discard_priority;
	}
	
	return card;
}