if (obj_battle_manager.turn_of_character == obj_battle_manager.player) {
	label = "end turn";
} else {
	label = "enemy turn";
}

if (
	obj_battle_manager.turn_of_character == obj_battle_manager.player
	&& obj_battle_manager.state_name == "turnDecideAction"
) {
	is_active = true;
} else {
	is_active = false;
}