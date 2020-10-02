function scr_card_definition_fishy_chest(card) {
	card.name = "fishy_chest";
	card.title = "fishy chest";
	card.is_unplayable = true;
	card.text = "When hit, do 2 damage. Permanently give your foe a random card.";
	card.counter = do_fishy_chest_counter;
	card.rarity = 1;
}

function do_fishy_chest_counter(target, source, card) {
	scr_take_damage(target, 2, source);
	
	var random_card = scr_create_card(scr_choose_from_list(scr_get_cards_of_tier(irandom(3))));
	var receiver = scr_get_opponent_of_character(card.owner);
	
	if (obj_battle_manager.player == receiver) {
		ds_list_add(obj_game_manager.player_deck_list, random_card.name);
	}

	ds_list_add(receiver.hand, random_card);
	with (random_card) {
		x = other.x;
		y = other.y;
		owner = receiver;
		state_switch("beingDrawn");
	}
}