function scr_character_taking_damage() {
	if (state_new) {
		_card_damage_delay = 0;
	}

	if (_card_damage_delay <= 0 && damage_to_take == 0) {
		state_switch_previous();
		exit;
	}

	if (obj_battle_manager.character_that_lost != noone) {
		_card_damage_delay = 0;
		damage_to_take = 0;
		state_switch_previous();
		exit;
	}

	if (_card_damage_delay <= 0 && damage_to_take > 0) {
		// Game over if there's nothing left in the hand.
		if (ds_list_size(hand) == 0) {
			damage_to_take = 0;
			state_switch_previous();
		
			with (obj_battle_manager) {
				character_that_lost = other.id;
				state_switch("end");
			}
		
			exit;
		}
	
		// Damage all cards.
		while (damage_to_take > 0 && ds_list_size(hand) > 0) {
			var damaged_card = scr_find_card_to_discard(hand);
	
			ds_list_add(graveyard, damaged_card);
			ds_list_delete(hand, ds_list_find_index(hand, damaged_card));
	
			with (damaged_card) {
				state_switch("damaged");
			}
	
			damage_to_take -= 1;
		}
	
		_card_damage_delay = 1 * room_speed;
		exit;
	}

	_card_damage_delay -= 1;
}
