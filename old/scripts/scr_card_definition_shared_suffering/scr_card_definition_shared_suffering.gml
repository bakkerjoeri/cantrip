function scr_card_definition_shared_suffering(card) {
	card.name = "shared_suffering";
	card.title = "shared suffering";
	card.cost = 2;
	card.text = "Do damage until your foe has as many cards as you.";
	card.effect = do_vile_bond_effect;
	card.condition = can_play_vile_bond;
	card.rarity = 2;
	card.has_priority = check_priority_for_shared_suffering;
}

function do_vile_bond_effect(target, source, card) {
	var damage = ds_list_size(target.hand) - ds_list_size(source.hand);
	scr_take_damage(target, damage, source);
}

function can_play_vile_bond(target, source) {
	var damage = ds_list_size(target.hand) - ds_list_size(source.hand);
	
	if (damage <= 0) {
		return false;
	}

	return true;
}

function check_priority_for_shared_suffering(target, source) {
	if (ds_list_size(target.hand) - ds_list_size(source.hand) >= 2) {
		return true;
	}
	
	return false;
}