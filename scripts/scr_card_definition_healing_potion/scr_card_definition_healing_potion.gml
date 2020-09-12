function scr_card_definition_healing_potion() {
	var definition = {
		name: "healing_potion",
		title: "healing potion",
		cost: 2,
		text: "Draw 3 cards.",
		effect: do_healing_potion_effect,
		condition: can_play_healing_potion,
	}
	
	return definition;
}

function do_healing_potion_effect(target, source) {
	with (source) {
		amount_of_cards_to_draw += 3;
		state_switch("drawingCards");
	}
}

function can_play_healing_potion(target, source) {
	return ds_list_size(source.draw_pile) > 0 || ds_list_size(source.graveyard) > 0;
}