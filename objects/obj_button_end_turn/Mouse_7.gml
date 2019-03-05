with (obj_battle_manager) {
	if (self.state_name == "turnDecideAction") {
		state_switch("turnEnd");
	}
}