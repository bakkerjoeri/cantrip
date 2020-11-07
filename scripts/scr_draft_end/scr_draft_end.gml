function scr_draft_end() {
	if (state_new) {
		with (obj_game_manager) {
			state_switch("gotoTravel");
		}
	}
}
