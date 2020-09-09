function scr_game_start() {
	if (state_new) {
		if (room != room_start) {
			room_goto(room_start);
			exit;
		}
	
		scr_load_game();
	}


}
