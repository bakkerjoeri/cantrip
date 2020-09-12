function scr_card_definition_catalyst() {
	var definition = {
		name: "catalyst",
		title: "catalyst",
		cost: 1,
		text: "This turn, when you play a card, draw a card.",
		effect: do_catalyst_effect,
	};
	
	return definition;
}

function do_catalyst_effect(target, source) {
	ds_list_add(source.active_effects, "catalyst");

	scr_add_end_of_turn_effect(
		source,
		"catalyst",
		remove_catalyst_effect,
		1,
	);
}

function remove_catalyst_effect(target, source) {
	var index_of_effect = ds_list_find_index(source.active_effects,  "catalyst");
			
	if (index_of_effect >= 0) {
		ds_list_delete(source.active_effects, index_of_effect);
	}
}