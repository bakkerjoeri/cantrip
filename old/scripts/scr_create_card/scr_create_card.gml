function scr_create_card(card_name) {
	var card_setup_script = asset_get_index("scr_card_definition_" + card_name);
	
	if (!script_exists(card_setup_script)) {
		throw "Card definition for " + card_name + "doesn't exist";
	}
	
	var card = instance_create_layer(0, 0, "Instances", obj_card_base);
	card_setup_script(card);
	
	return card;
}