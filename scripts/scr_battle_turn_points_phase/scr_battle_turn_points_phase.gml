function scr_battle_turn_points_phase() {
	scr_character_gains_ap(turn_of_character, 1);

	state_switch("turnPlayPhase");


}
