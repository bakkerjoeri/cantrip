if (obj_battle_manager.turn_of_character == obj_battle_manager.opponent) {
	label = "enemy turn";
} else {
	label = "end turn";
}

if (
	obj_battle_manager.turn_of_character == obj_battle_manager.player
	&& obj_battle_manager.state_name == "turnPlayPhase"
	&& obj_battle_manager.turn_of_character.state_name == "deciding"
) {
	is_active = true;
} else {
	is_active = false;
}