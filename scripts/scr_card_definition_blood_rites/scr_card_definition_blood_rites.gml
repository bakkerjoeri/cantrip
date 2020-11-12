function scr_card_definition_blood_rites(card) {
	card.name = "blood_rites";
	card.title = "blood rites";
	card.cost = 2;
	card.text = "Reduce your hand size by 1. Draw until your hand is full. Regain all AP.";
	card.effect = do_blood_rites_effect;
	card.rarity = 2;
	card.has_priority = should_play_blood_rites;
}

function do_blood_rites_effect(target, source) {
	obj_screen_manager.shake += 6;
	source.max_hand_size = max(0, source.max_hand_size - 1);
	scr_draw_cards(source, source.max_hand_size - ds_list_size(source.hand));
	scr_character_gains_ap(source, source.max_ability_points - source.ability_points);
	scr_add_event_log("Red mist gathers around " + source.name + ". They feel rejuvenated, but a hollowness remains.");
}

function should_play_blood_rites(target, source) {
	if (ds_list_size(source.hand) <= 3) {
		return true;
	}
	
	return false;
}