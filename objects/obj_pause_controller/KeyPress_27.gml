if (obj_pause_controller.state_name == "paused") {
	with (obj_pause_controller) {
		state_switch("unpaused");
	}
} else {
	with (obj_pause_controller) {
		state_switch("paused");
	}
}