function scr_battle_turn_points_phase() {
	if (state_new) {
		if (obj_game_manager.perks.supermoon) {
			scr_character_gains_ap(turn_of_character, turn_of_character.max_ability_points - turn_of_character.ability_points);
		} else {
			scr_character_gains_ap(turn_of_character, 1);
		}

		exit;
	}
	
	if (turn_of_character.state_name == "waiting") {
		state_switch("turnPlayPhase");
	}
}
