var amount_of_cards = argument[0];
var owner = argument[1];
var deck = ds_list_create();

var other_deck = ds_map_create();

ds_map_add(other_deck, "attack", 3);
ds_map_add(other_deck, "fireblast", 1);
ds_map_add(other_deck, "rest", 2);
ds_map_add(other_deck, "combust", 2);


repeat(amount_of_cards) {
	var card_type = choose(
		obj_card_attack,
		//obj_card_roll_the_bones,
		//obj_card_meditate,
		//obj_card_mindswap,
		obj_card_fireblast,
		obj_card_combust,
		obj_card_rest,
		//obj_card_leech,
		//obj_card_healing_potion
	);
	
	var card = instance_create_layer(0, 0, "Instances_default", card_type);
	
	card.is_face_up = false;
	card.owner = owner;

	ds_list_add(deck, card);
}

return deck;