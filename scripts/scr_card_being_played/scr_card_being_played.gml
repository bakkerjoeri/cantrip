function scr_card_being_played() {
	if (state_new) {
		animation_add_wait(.5 * room_speed);

		exit;
	}

	if (animation_is_finished) {
		if (!is_undefined(effect)) {
			var target = noone;
			var source = owner;
			var target = scr_get_opponent_of_character(owner);
		
			script_execute(effect, target, source, self.id);
		}
	
		state_switch("isResolved");
	}


}
