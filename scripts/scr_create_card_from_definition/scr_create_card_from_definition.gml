function scr_create_card_from_definition(card_definition, owner) {
	//var card = instance_create_layer(0, 0, "Instances", asset_get_index("obj_card_" + card_definition.name));
	var card = instance_create_layer(0, 0, "Instances", obj_card_base);
	card.owner = owner;
	
	card.name = card_definition.name;
	card.title = card_definition.title;
	card.text = card_definition.text;
	card.cost = card_definition.cost;
	card.effect = card_definition.effect;
	
	if (variable_struct_exists(card_definition, "condition")) {
		card.condition = card_definition.condition;
	}
	
	return card;
}