function scr_game_battle() {
	if (state_new) {
		with (obj_battle_manager) {
			state_switch("start");
		}
	}
}
