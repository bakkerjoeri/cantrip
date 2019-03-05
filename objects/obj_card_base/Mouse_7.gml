if (
	obj_battle_manager.state_name == "turnDecideAction"
	&& obj_battle_manager.turn_of_character == owner
	&& obj_battle_manager.turn_of_character == obj_battle_manager.player
) {
	scr_card_selectable();
}