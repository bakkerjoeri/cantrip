function scr_get_card_definition_map(){
	var card_definition_map = ds_map_create();
	
	card_definition_map[? "attack"] = scr_card_definition_attack();
	card_definition_map[? "combust"] = scr_card_definition_combust();
	
	return card_definition_map;
}