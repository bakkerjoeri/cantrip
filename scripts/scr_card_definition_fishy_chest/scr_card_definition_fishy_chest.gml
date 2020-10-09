function scr_card_definition_fishy_chest(card) {
	card.name = "fishy_chest";
	card.title = "fishy chest";
	card.is_unplayable = true;
	card.text = "When hit, burn a card. Your foe earns a random card.";
	card.counter = do_fishy_chest_counter;
	card.rarity = 3;
}

function do_fishy_chest_counter(target, source, card) {
	var card_to_burn = scr_choose_from_list(target.hand);
	
	if (card_to_burn) {
		card_to_burn.is_burning = true;
	}
	
	var recipient = scr_get_opponent_of_character(card.owner);
	
	var random_card_list = scr_get_cards_of_tier(irandom(3));
	var random_card_name = scr_choose_from_list(random_card_list);
	var random_card = scr_create_card(random_card_name);
	
	if (recipient == obj_battle_manager.player) {
		ds_list_add(obj_game_manager.player_deck_list, random_card_name);
	}
	
	random_card.x = (room_width / 2) - 32;
	random_card.y = (room_height / 2) - 48;
	random_card.owner = recipient;

	if (ds_list_size(recipient.hand) < recipient.max_hand_size) {
		ds_list_add(recipient.hand, random_card);
		
		with (random_card) {
			state_switch("beingDrawn");
		}
	} else {
		ds_list_add(recipient.graveyard, random_card);
		
		with (random_card) {
			state_switch("beingDiscarded");
		}
	}
	
	if (card_to_burn && card_to_burn.is_face_up) {
		scr_add_event_log(recipient.name + " opens the chest and finds " + random_card.title + "! Suddenly a burst of flame shoots out and " + target.name + "'s " + card_to_burn.title + " starts burning.");
	} else if (card_to_burn) {
		scr_add_event_log(recipient.name + " opens the chest and finds " + random_card.title + "! Suddenly a burst of flame shoots out and one of " + target.name + "'s cards starts burning.");
	} else {
		scr_add_event_log(recipient.name + " opens the chest and finds " + random_card.title + "!");
	}
	
}