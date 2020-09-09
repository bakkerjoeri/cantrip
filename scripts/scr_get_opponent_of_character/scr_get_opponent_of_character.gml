/// scr_get_opponent_of_character(character);
function scr_get_opponent_of_character() {
	var character = argument[0];

	if (character != obj_battle_manager.opponent) {
		return obj_battle_manager.opponent;
	} else {
		return obj_battle_manager.player;
	}


}
