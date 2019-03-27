if (instance_exists(obj_pause_controller)) {
	if (obj_pause_controller.state_name == "paused") {
		label = "unpause";
	} else {
		label = "pause";
	}
}