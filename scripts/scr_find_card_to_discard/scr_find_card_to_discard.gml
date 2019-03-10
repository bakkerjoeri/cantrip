var pile = argument[0];

for (var d = 2; d >= 0; d -= 1) {
	var cards_to_discard = scr_find_cards_with_discard_priority(pile, d);
	
	if (ds_list_empty(cards_to_discard)) {
		continue;
	}
	
	return scr_choose_from_list(cards_to_discard);
}

return scr_choose_from_list(pile);