function scr_card_being_discarded() {
	if (state_new) {
		if (ds_list_find_index(owner.graveyard, self.id) == -1) {
			ds_list_add(owner.graveyard, self.id);
		}
	
		depth = ds_list_size(owner.graveyard) - 1 - ds_list_find_index(owner.graveyard, self.id);
		is_face_up = true;
		
		if (variable_instance_exists(self.id, "on_discard")) {
			do_on_discard_effect(self.id, self.on_discard);
		}
	
		var current_graveyard_size = ds_list_size(owner.graveyard);
		var current_graveyard_position = ds_list_find_index(owner.graveyard, self.id);
	
		animation_add_next(
			owner.graveyard_x + (2 * (current_graveyard_position - current_graveyard_size + min(3, current_graveyard_size))),
			owner.graveyard_y,
			.25 * room_speed,
			ease_out_quint,
		);
	
		exit;
	}

	if (animation_is_finished) {
		state_switch("inGraveyard");
	}
}

function do_on_discard_effect(card, effect) {
	var source = card.owner;
	var target = scr_get_opponent_of_character(source);

	effect(target, source, card);
}