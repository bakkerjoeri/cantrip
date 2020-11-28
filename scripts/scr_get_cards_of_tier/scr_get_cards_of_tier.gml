/// scr_get_cards_of_tier
function scr_get_cards_of_tier(tier) {
	var cards = ds_list_create();

	if (tier == 0) {
		ds_list_add(cards, "attack");
		ds_list_add(cards, "barter_for_power");
		ds_list_add(cards, "combust");
		ds_list_add(cards, "corrupted_aether");
		ds_list_add(cards, "cruel_divination");
		ds_list_add(cards, "desecrate");
		
		if (!obj_game_manager.perks.supermoon) {
			ds_list_add(cards, "meditate");
		}
		
		ds_list_add(cards, "pickpocket");
		
		if (!obj_game_manager.perks.supermoon) {
			ds_list_add(cards, "rest");
		}

		ds_list_add(cards, "revenge_from_beyond");
		ds_list_add(cards, "riposte");
		ds_list_add(cards, "shield");
		ds_list_add(cards, "stamina_potion");
		
		if (!obj_game_manager.perks.clairvoyant) {
			ds_list_add(cards, "third_eye_opens");
		}

		ds_list_add(cards, "transmute");
	}

	if (tier == 1) {
		ds_list_add(cards, "embed_spikes");
		ds_list_add(cards, "forge");
		ds_list_add(cards, "healing_potion");
		ds_list_add(cards, "healing_rain");
		ds_list_add(cards, "improvise");
		ds_list_add(cards, "leech");
		ds_list_add(cards, "life_link");
		ds_list_add(cards, "necrotic_blast");
		ds_list_add(cards, "poison_the_well");
		ds_list_add(cards, "quickshot");
		ds_list_add(cards, "raise_the_dead");
		ds_list_add(cards, "radiant_burst");
		ds_list_add(cards, "read_mind");
		ds_list_add(cards, "shield_bash");
		ds_list_add(cards, "shields_up");
		ds_list_add(cards, "siphon");
		ds_list_add(cards, "soul_trap");
		ds_list_add(cards, "volatile_mixture");
		ds_list_add(cards, "waning");
	}

	if (tier == 2) {
		ds_list_add(cards, "blood_rites");
		ds_list_add(cards, "call_of_the_void");
		
		if (!obj_game_manager.perks.forbidden_alchemy) {
			ds_list_add(cards, "catalyst");
		}

		if (!obj_game_manager.perks.vampires_curse) {
			ds_list_add(cards, "dark_pact");
		}
		
		ds_list_add(cards, "expand_mind");
		ds_list_add(cards, "fireblast");
		ds_list_add(cards, "full_moon");
		ds_list_add(cards, "lichen_curse");
		ds_list_add(cards, "lightning_bolt");
		ds_list_add(cards, "lunar_surge");
		ds_list_add(cards, "mana_burst");
		ds_list_add(cards, "mindswap");
		ds_list_add(cards, "seance");
		ds_list_add(cards, "shadow_twin");
		ds_list_add(cards, "shared_suffering");
		ds_list_add(cards, "the_hunger");
		ds_list_add(cards, "wellspring");
	}
	
	if (tier == 3) {
		ds_list_add(cards, "blaze");
		ds_list_add(cards, "eldritch_blast");
		ds_list_add(cards, "fire_trap");
		ds_list_add(cards, "piercing_strike");
		ds_list_add(cards, "plague_bomb");
		ds_list_add(cards, "possess");
		ds_list_add(cards, "rage");
		ds_list_add(cards, "sneak_attack");
		ds_list_add(cards, "venomous_bite");
		ds_list_add(cards, "volley");
	}
	
	return cards;
}
