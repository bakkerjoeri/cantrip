function scr_card_is_resolved() {
	if (state_new) {
		animation_add_wait(1 * room_speed);
	}

	if (animation_is_finished) {
		if (
			scr_does_list_contain_item(played_by.active_effects, "shadow_twin")
			&& self.name != "shadow_twin"
		) {
			scr_remove_item_from_list(played_by.active_effects, "shadow_twin");
			state_switch("beingPlayed");
			scr_add_event_log(played_by.name + "'s shadow takes shape, and repeats " + self.name);
		} else {
			played_by = noone;
			state_switch("beingDiscarded");
		}
	}
}
