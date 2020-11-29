state_execute();

if (
	obj_battle_manager.card_with_focus != noone
	&& obj_battle_manager.card_with_focus.owner == self.id
	&& obj_battle_manager.card_with_focus.state_name == "inHand"
	&& variable_instance_exists(obj_battle_manager.card_with_focus, "highlight")
) {
	cards_to_highlight = obj_battle_manager.card_with_focus.highlight(scr_get_opponent_of_character(self.id), self.id);
} else {
	if (cards_to_highlight) {
		ds_list_destroy(cards_to_highlight);
	}

	cards_to_highlight = undefined;
}