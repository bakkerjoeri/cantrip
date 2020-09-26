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
			do_damage_effect();

			var damaged_card = scr_find_card_to_discard(hand, _current_damage_event[? "invert_discard_order"]);
			scr_move_item_between_lists(damaged_card, hand, graveyard);
	
			with (damaged_card) {
				state_switch("damaged");
			}
			
			if (variable_instance_exists(damaged_card, "counter")) {
				damaged_card.counter(
					_current_damage_event[? "source"],
					_current_damage_event[? "target"]
				);
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

function do_death_effect() {
	instance_create_layer(0, 0, "Overlays", obj_damage_flash);

	with (obj_screen_manager) {
		shake += 16;
	}
}