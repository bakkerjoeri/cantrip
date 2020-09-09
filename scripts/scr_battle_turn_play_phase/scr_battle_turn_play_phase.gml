function scr_battle_turn_play_phase() {
	if (state_new) {
		with (turn_of_character) {
			state_switch("deciding");
		}
	}


}
