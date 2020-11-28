function scr_card_being_played() {
	if (state_new) {
		should_play_again = false;

		if (played_by == noone) {
			played_by = owner;
		}
		
		if (
			scr_does_list_contain_item(played_by.active_effects, "shadow_twin")
			&& self.name != "shadow_twin"
		) {
			scr_remove_item_from_list(played_by.active_effects, "shadow_twin");
			should_play_again = true;
		}
		
		if (!owner.is_controlled_by_player) {
			animation_add_wait(.5 * room_speed);
		}

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
	}
}
