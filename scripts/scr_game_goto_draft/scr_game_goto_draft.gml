if (state_new) {
	if (room != room_draft) {
		room_goto(room_draft);
	}
	
	state_switch("draft");
}