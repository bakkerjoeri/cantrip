function scr_draft_end() {
	if (state_new) {
		instance_create_layer((room_width / 2) - 32, 152, "Instances", obj_button_go_to_next_battle);
	}


}
