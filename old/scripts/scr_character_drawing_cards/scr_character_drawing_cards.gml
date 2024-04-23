function scr_character_drawing_cards() {
	if (state_new) {
		_card_draw_delay = 0;
	}

	if (_card_draw_delay <= 0 && amount_of_cards_to_draw == 0) {
		state_switch_previous();
		exit;
	}

	if (_card_draw_delay <= 0 && amount_of_cards_to_draw > 0) {
		// Stop drawing if it will exceed the max hand size.
		if (ds_list_size(hand) >= max_hand_size) {
			amount_of_cards_to_draw = 0;
			state_switch_previous();
			exit;
		}
	
		// Reshuffle cards if there aren't enough in the draw pile.
		if (ds_list_size(draw_pile) == 0 && ds_list_size(graveyard) > 0) {
			for (var c = 0; c <= ds_list_size(graveyard) - 1; c += 1) {
				var card_to_reshuffle = ds_list_find_value(graveyard, c);

				with (card_to_reshuffle) {
					state_switch("beingReshuffled");
				}
			}
		
			scr_move_all_items_between_lists(graveyard, draw_pile);
			ds_list_shuffle(draw_pile);
			exit;
		}
	
		// Stop trying to draw if there are none left.
		if (ds_list_size(draw_pile) == 0 && ds_list_size(graveyard) == 0) {
			amount_of_cards_to_draw = 0;
			state_switch_previous();
			exit;
		}
	
		var card_to_draw = ds_list_find_value(draw_pile, ds_list_size(draw_pile) - 1);
		scr_move_item_between_lists(card_to_draw, draw_pile, hand);
	
		with (card_to_draw) {
			state_switch("beingDrawn");
		}
	
		amount_of_cards_to_draw -= 1;
		
		// Apply dark pact effect
		if (scr_does_list_contain_item(active_effects, "dark_pact")) {
			scr_take_damage(scr_get_opponent_of_character(self.id), 1, self.id);
		}
		
		// Apply life link effect
		if (scr_does_list_contain_item(
			scr_get_opponent_of_character(self.id).active_effects,
			"life_link")
		) {
			scr_draw_cards(scr_get_opponent_of_character(self.id), 1);
		}
		
		// Apply wellspring effect
		if (scr_does_list_contain_item(active_effects, "wellspring")) {
			scr_character_gains_ap(self.id, 1);
		}
		
		if (scr_does_list_contain_item(active_effects, "cruel_divination")) {
			var damage = 0;
			
			if (variable_instance_exists(card_to_draw, "cost")) {
				damage = card_to_draw.cost;
			}
			
			if (damage > 0) {
				scr_take_damage(scr_get_opponent_of_character(self.id), damage, self.id);
			}

			scr_remove_item_from_list(active_effects, "cruel_divination");
		}
	
		_card_draw_delay = 0.25 * room_speed;
		exit;
	}

	_card_draw_delay -= 1;
}
