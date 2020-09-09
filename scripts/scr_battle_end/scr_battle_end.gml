function scr_battle_end() {
	if (state_new) {
		if (character_that_lost == player) {
			state_switch("lost");
		} else {
			state_switch("won");
		}
	}


}
