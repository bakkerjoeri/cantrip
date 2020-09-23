function scr_card_being_played() {
	if (state_new) {
		if (played_by == noone) {
			played_by = owner;
		}
		
		animation_add_wait(.5 * room_speed);

		exit;
	}

	if (animation_is_finished) {
		// Switch states before running the effect, so the effect might be able to affect state as well.
		state_switch("isResolved");
		
		if (!is_undefined(effect)) {
			var source = played_by;
			var target = scr_get_opponent_of_character(played_by);
		
			script_execute(effect, target, source, self.id);
		}
	
		played_by = noone;
	}
}
