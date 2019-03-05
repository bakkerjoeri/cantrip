if (!selected_card) {
	state_switch("turnDecideAction");
	exit;
}

if (turn_of_character.ability_points < selected_card.cost) {
	state_switch("turnDecideAction");
	exit;
}

turn_of_character.ability_points -= selected_card.cost;

ds_list_delete(turn_of_character.hand, ds_list_find_index(turn_of_character.hand, selected_card));
ds_list_add(turn_of_character.graveyard, selected_card);

state_switch("turnDecideAction");