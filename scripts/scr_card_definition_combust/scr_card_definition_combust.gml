function scr_card_definition_combust(){
	var card_definition = {
		name: "combust",
		title: "combust",
		cost: 1,
		text: "Take 1 damage, do 2 damage.",
		effect: do_combust_effect,
		condition: can_play_combust,
	}
	
	return card_definition;
}

function do_combust_effect(target, source) {
	scr_take_damage(source, 1, source);
	scr_take_damage(target, 2, source);
}

function can_play_combust(source) {
	if (source == obj_battle_manager.player) {
		return true;
	}

	if (ds_list_size(source.hand) <= 1) {
		return false;
	}
	
	return true;
}