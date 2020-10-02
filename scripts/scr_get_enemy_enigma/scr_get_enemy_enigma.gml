function scr_get_enemy_enigma() {
	var boss = ds_map_create();

	boss[? "name"] = "Chaos";
	boss[? "deck_list"] = scr_get_deck_list_enigma();
	boss[? "max_ability_points"] = 3;
	boss[? "max_hand_size"] = 9;

	return boss;
}

function scr_get_deck_list_enigma() {
	var deck_list = ds_list_create();

	repeat (5) {
		ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(0)));
	}

	repeat (4) {
		ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(1)));
	}

	repeat (3) {
		ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(2)));
	}
	
	repeat (2) {
		ds_list_add(deck_list, scr_choose_from_list(scr_get_cards_of_tier(3)));
	}

	return deck_list;
}
