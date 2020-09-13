function scr_get_card_definition_map(){
	var card_definition_map = ds_map_create();
	
	card_definition_map[? "attack"] = scr_card_definition_attack();
	card_definition_map[? "catalyst"] = scr_card_definition_catalyst();
	card_definition_map[? "combust"] = scr_card_definition_combust();
	card_definition_map[? "desecrate"] = scr_card_definition_desecrate();
	card_definition_map[? "embed_spikes"] = scr_card_definition_embed_spikes();
	card_definition_map[? "fireblast"] = scr_card_definition_fireblast();
	card_definition_map[? "forge"] = scr_card_definition_forge();
	card_definition_map[? "healing_potion"] = scr_card_definition_healing_potion();
	card_definition_map[? "leech"] = scr_card_definition_leech();
	card_definition_map[? "mana_burst"] = scr_card_definition_mana_burst();
	card_definition_map[? "meditate"] = scr_card_definition_meditate();
	card_definition_map[? "mindswap"] = scr_card_definition_mindswap();
	card_definition_map[? "necrotic_blast"] = scr_card_definition_necrotic_blast();
	card_definition_map[? "raise_the_dead"] = scr_card_definition_raise_the_dead();
	card_definition_map[? "read_mind"] = scr_card_definition_read_mind();
	card_definition_map[? "rest"] = scr_card_definition_rest();
	card_definition_map[? "revenge_from_beyond"] = scr_card_definition_revenge_from_beyond();
	card_definition_map[? "seance"] = scr_card_definition_seance();
	card_definition_map[? "shield"] = scr_card_definition_shield();
	card_definition_map[? "shield_bash"] = scr_card_definition_shield_bash();
	card_definition_map[? "shields_up"] = scr_card_definition_shields_up();
	card_definition_map[? "siphon"] = scr_card_definition_siphon();
	card_definition_map[? "stamina_potion"] = scr_card_definition_stamina_potion();
	card_definition_map[? "transmute_shields"] = scr_card_definition_transmute_shields();

	return card_definition_map;
}