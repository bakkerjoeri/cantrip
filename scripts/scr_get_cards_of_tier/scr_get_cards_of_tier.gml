/// scr_get_cards_of_tier
var tier = argument[0];
var cards = ds_list_create();

if (tier == 0) {
	ds_list_add(cards, "attack");
	ds_list_add(cards, "leech");
	ds_list_add(cards, "combust");
	ds_list_add(cards, "rest");
	ds_list_add(cards, "transmute_shields");
	ds_list_add(cards, "raise_the_dead");
	ds_list_add(cards, "revenge_from_beyond");
	ds_list_add(cards, "read_mind");
}

if (tier == 1) {
	ds_list_add(cards, "meditate");
	ds_list_add(cards, "healing_potion");
	ds_list_add(cards, "shield_bash");
	ds_list_add(cards, "shields_up");
	ds_list_add(cards, "stamina_potion");
	ds_list_add(cards, "desecrate");
}

if (tier == 2) {
	ds_list_add(cards, "mindswap");
	ds_list_add(cards, "seance");
	ds_list_add(cards, "siphon");
	ds_list_add(cards, "fireblast");
	ds_list_add(cards, "mana_burst");
}

return cards;