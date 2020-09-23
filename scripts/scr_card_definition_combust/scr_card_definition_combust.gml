function scr_card_definition_combust(card) {
	card.name = "combust";
	card.title = "combust";
	card.cost = 1;
	card.text = "Take 1 damage, do 2 damage.";
	card.effect = do_combust_effect;
	card.condition = can_play_combust;
}

function do_combust_effect(target, source) {
	scr_take_damage(source, 1, source);
	scr_take_damage(target, 2, source);
}

function can_play_combust(target, source) {
	if (source == obj_battle_manager.player) {
		return true;
	}

	if (ds_list_size(source.hand) <= 1) {
		return false;
	}
	
	return true;
}