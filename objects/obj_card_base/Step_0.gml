state_execute();

if (
	obj_battle_manager.state_name == "turnDecideAction"
	&& obj_battle_manager.turn_of_character == owner
	&& obj_battle_manager.turn_of_character == obj_battle_manager.player
	&& ds_list_find_index(obj_battle_manager.player.hand, self) > -1
) {
	scr_card_selectable();
}