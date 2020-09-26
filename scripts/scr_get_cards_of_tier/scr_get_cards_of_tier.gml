/// scr_get_cards_of_tier
function scr_get_cards_of_tier() {
	var tier = argument[0];
	var cards = ds_list_create();

	if (tier == 0) {
		ds_list_add(cards, "shield");
		ds_list_add(cards, "attack");
		ds_list_add(cards, "riposte");
		ds_list_add(cards, "combust");
		ds_list_add(cards, "corrupted_aether");
		ds_list_add(cards, "rest");
		ds_list_add(cards, "meditate");
		ds_list_add(cards, "transmute");
		ds_list_add(cards, "revenge_from_beyond");
		ds_list_add(cards, "desecrate");
		ds_list_add(cards, "stamina_potion");
		ds_list_add(cards, "barter_for_power");
		ds_list_add(cards, "third_eye_opens");
		ds_list_add(cards, "radiant_burst");
	}

	if (tier == 1) {
		ds_list_add(cards, "leech");
		ds_list_add(cards, "read_mind");
		ds_list_add(cards, "healing_potion");
		ds_list_add(cards, "shield_bash");
		ds_list_add(cards, "shields_up");
		ds_list_add(cards, "raise_the_dead");
		ds_list_add(cards, "forge");
		ds_list_add(cards, "embed_spikes");
		ds_list_add(cards, "necrotic_blast");
		ds_list_add(cards, "volatile_mixture");
		ds_list_add(cards, "the_hunger");
		ds_list_add(cards, "siphon");
	}

	if (tier == 2) {
		ds_list_add(cards, "mindswap");
		ds_list_add(cards, "seance");
		ds_list_add(cards, "fireblast");
		ds_list_add(cards, "mana_burst");
		ds_list_add(cards, "catalyst");
		ds_list_add(cards, "lunar_surge");
	}

	return cards;


}
