function scr_character_taking_damage() {
	if (state_new) {
		_card_damage_delay = 0;
		_amount_left_for_event = 0;
		_current_damage_event = noone;
	}

	if (
		_card_damage_delay <= 0 &&
		_amount_left_for_event <= 0 &&
		ds_queue_empty(damage_events)
	) {
		show_debug_message("no more damage events left...");
		state_switch_previous();
		exit;
	}

	if (obj_battle_manager.character_that_lost != noone) {
		_card_damage_delay = 0;
		ds_queue_clear(damage_events);
		state_switch_previous();
		exit;
	}

	if (_card_damage_delay <= 0 && (!ds_queue_empty(damage_events) || _amount_left_for_event > 0)) {
		// Game over if there's nothing left in the hand.
		if (ds_list_size(hand) == 0) {
			scr_add_event_log(name + " is defeated!");
			do_death_effect();
			ds_queue_clear(damage_events);
			state_switch_previous();

			with (obj_battle_manager) {
				character_that_lost = other.id;
				state_switch("end");
			}
		
			exit;
		}

		// Damage all cards.
		if (_amount_left_for_event == 0 && !ds_queue_empty(damage_events)) {
			_current_damage_event = ds_queue_dequeue(damage_events);
			_amount_left_for_event = _current_damage_event[? "amount"];
		}
		
		if (_amount_left_for_event > 0) {
			var should_invert_discard_order;
			if (variable_struct_exists(_current_damage_event[? "damage_options"], "invert_discard_order")) {
				should_invert_discard_order = _current_damage_event[? "damage_options"].invert_discard_order;
			} else {
				should_invert_discard_order = false;
			}
			
			var deflected_by_shields;
			if (variable_struct_exists(_current_damage_event[? "damage_options"], "deflected_by_shields")) {
				deflected_by_shields = _current_damage_event[? "damage_options"].deflected_by_shields;
			} else {
				deflected_by_shields = false;
			}
			
			var is_piercing;
			if (variable_struct_exists(_current_damage_event[? "damage_options"], "is_piercing")) {
				is_piercing = _current_damage_event[? "damage_options"].is_piercing;
			} else {
				is_piercing = false;
			}
			
			var cards;
			if (variable_struct_exists(_current_damage_event[? "damage_options"], "cards")) {
				cards = _current_damage_event[? "damage_options"].cards;
			} else {
				cards = [];
			}
			
			var from_burning;
			if (variable_struct_exists(_current_damage_event[? "damage_options"], "from_burning")) {
				from_burning = _current_damage_event[? "damage_options"].from_burning;
			} else {
				from_burning = false;
			}

			var damaged_card;
			if (array_length(cards) > 0 && scr_does_list_contain_item(hand, array_get(cards, 0))) {
				damaged_card = array_get(cards, 0);
				show_debug_message("Forcing a card to take damage: " + damaged_card.title);
				_current_damage_event[? "damage_options"].cards = scr_get_array_slice(cards, 1, array_length(cards) - 1);
				
				show_debug_message("After damage, forced cards left: " + string(array_length(_current_damage_event[? "damage_options"].cards)));
			} else {
				damaged_card = scr_find_card_to_discard(hand, should_invert_discard_order);
			}
			
			
			var is_damaged_deflected = deflected_by_shields && damaged_card.name == "shield";
			
			if (is_damaged_deflected) {
				// Damage prevented
				do_deflect_effect();
				
				with (damaged_card) {
					state_switch("hasDeflected");
				}
				
				scr_add_event_log(_current_damage_event[? "target"].name + " deflects the hit!");
			} else {
				// Damage is gonna happen!
				do_damage_effect();
				scr_move_item_between_lists(damaged_card, hand, graveyard);
	
				with (damaged_card) {
					state_switch("damaged");
				}
				
				if (from_burning) {
					scr_add_event_log(_current_damage_event[? "source"].name + "'s " + damaged_card.title + " goes up in flames!");
				} else if (_current_damage_event[? "source"] == _current_damage_event[? "target"]) {
					scr_add_event_log(_current_damage_event[? "source"].name + " hits their own " + damaged_card.title + "!");
				} else {
					scr_add_event_log(_current_damage_event[? "source"].name + " hits " + _current_damage_event[? "target"].name + "'s " + damaged_card.title + "!");
				}
				
				if (damaged_card.name == "shield" && is_piercing) {
					scr_take_damage(_current_damage_event[? "target"], 1, _current_damage_event[? "source"]);
				}
			
				if (variable_instance_exists(damaged_card, "counter")) {
					damaged_card.counter(
						_current_damage_event[? "source"],
						_current_damage_event[? "target"],
						damaged_card
					);
				}
				
				// Resolve vampirism
				if (
					obj_game_manager.perks.vampires_curse
					&& _current_damage_event[? "source"] == obj_battle_manager.player
					&& _current_damage_event[? "target"] == obj_battle_manager.opponent
				) {
					with (_current_damage_event[? "source"]) {
						amount_of_cards_to_draw += 1;
					}
				}
				
				// Resolve lichen curse
				if (
					scr_does_list_contain_item(active_effects, "lichen_curse")
					&& _current_damage_event[? "source"] != _current_damage_event[? "target"]
				) {
					scr_character_gains_ap(_current_damage_event[? "source"], 1);
				}
			}
			
			_amount_left_for_event -= 1;
			_card_damage_delay = 0.1 * room_speed;
			exit;
		}
	
		_card_damage_delay = 1 * room_speed;
		exit;
	}

	_card_damage_delay -= 1;
}

function do_damage_effect() {
	instance_create_layer(0, 0, "Overlays", obj_damage_flash);

	with (obj_screen_manager) {
		shake = 8;
	}
}

function do_deflect_effect() {
	instance_create_layer(0, 0, "Overlays", obj_deflect_flash);

	with (obj_screen_manager) {
		shake = 4;
	}
}

function do_death_effect() {
	instance_create_layer(0, 0, "Overlays", obj_damage_flash);

	with (obj_screen_manager) {
		shake += 16;
	}
}