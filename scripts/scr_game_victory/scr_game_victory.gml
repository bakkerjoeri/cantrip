if (state_new) {
	if (room != room_victory) {
		room_goto(room_victory);
		exit;
	}
	
	runs_won = runs_won + 1;
	scr_save_game();
}