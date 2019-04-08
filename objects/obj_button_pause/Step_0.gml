if (instance_exists(obj_pause_controller)) {
	if (obj_pause_controller.state_name == "paused") {
		pause_icon_sprite = spr_button_icon_resume;
	} else {
		pause_icon_sprite = spr_button_icon_pause;
	}
}

if (is_active) {
	if (has_focus) {
		pause_icon_sprite_index = 1;
	} else {
		pause_icon_sprite_index = 0;
	}
} else {
	pause_icon_sprite_index = 2;
}