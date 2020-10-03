function scr_card_definition_fishy_chest(card) {
	card.name = "fishy_chest";
	card.title = "fishy chest";
	card.is_unplayable = true;
	card.text = "When hit, do 2 damage. Permanently give your foe a random card.";
	card.counter = do_fishy_chest_counter;
	card.rarity = 3;
}

function do_fishy_chest_counter(target, source, card) {
	scr_take_damage(target, 2, source);
	
	show_debug_message("Attempt 9");
	
	var recipient = scr_get_opponent_of_character(card.owner);
	
	if (ds_list_size(recipient.hand) == recipient.max_hand_size) {
		return;
	}
	
	var random_card_list = scr_get_cards_of_tier(irandom(3));
	var random_card_name = scr_choose_from_list(random_card_list);
	show_debug_message("Gonna make card: " + random_card_name);
	var random_card = scr_create_card(random_card_name);
	
	if (recipient == obj_battle_manager.player) {
		ds_list_add(obj_game_manager.player_deck_list, random_card_name);
	}

	ds_list_add(recipient.hand, random_card);

	random_card.x = (room_width / 2) - 32;
	random_card.y = (room_height / 2) - 48;
	random_card.owner = recipient;
	
	with (random_card) {
		state_switch("beingDrawn");
	}
}