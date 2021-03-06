function scr_card_definition_rest(card) {
	card.name = "rest";
	card.title = "rest";
	card.cost = 0;
	card.text = "Draw 1 card, Gain 1 AP, end your turn.";
	card.effect = do_rest_effect;
	card.rarity = 0;
	card.has_priority = check_priority_for_rest;
}

function do_rest_effect(target, source) {
	scr_character_gains_ap(source, 1);
	scr_draw_cards(source, 1);

	if (
		obj_battle_manager.turn_of_character == source
		&& obj_battle_manager.state_name != "lost"
		&& obj_battle_manager.state_name != "won"
		&& obj_battle_manager.state_name != "end"
	) {
		with (obj_battle_manager) {
			state_switch("turnEnd");
		}
	}
}

function check_priority_for_rest(target, source, playable_cards) {
	if (ds_list_size(playable_cards) <= 1) {
		return true;
	}
	
	return false;
}