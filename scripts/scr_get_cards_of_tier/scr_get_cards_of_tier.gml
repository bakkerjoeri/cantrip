/// scr_get_cards_of_tier
var tier = argument[0];
var cards = ds_list_create();

if (tier == 0) {
	ds_list_add(cards, "leech");
	ds_list_add(cards, "combust");
	ds_list_add(cards, "rest");
}

if (tier == 1) {
	ds_list_add(cards, "fireblast");
	ds_list_add(cards, "meditate");
	ds_list_add(cards, "health_potion");
}

if (tier == 2) {
	ds_list_add(cards, "fireblast");
	ds_list_add(cards, "fireblast");
	ds_list_add(cards, "fireblast");
}

return cards;