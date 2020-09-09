function scr_game_goto_battle() {
	if (state_new) {
		if (room != room_combat) {
			room_goto(room_combat);
		}
	
		state_switch("battle");
	}


}
