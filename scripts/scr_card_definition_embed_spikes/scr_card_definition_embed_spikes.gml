function scr_card_definition_embed_spikes(card) {
	card.name = "embed_spikes";
	card.title = "embed spikes";
	card.cost = 1;
	card.text = "\"shield\" cards in your hand do 1 (more) damage when hit.";
	card.effect = do_embed_spikes_effect;
	card.condition = can_play_embed_spikes;
	card.rarity = 1;
	card.has_priority = check_priority_for_embed_spikes;
}

function do_embed_spikes_effect(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			card.damage += 1;
			card.text = get_shield_card_text(card);
			card.counter = spiked_shield_counter;
		}
	}
	
	scr_add_event_log(source.name + "'s shields now look sharp to the touch.");
}

function spiked_shield_counter(target, source, card) {
	scr_take_damage(target, card.damage, source);
}

function can_play_embed_spikes(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "shield") {
			return true;
		}
	}

	return false;
}

function check_priority_for_embed_spikes(target, source) {
	var amount_of_shield_cards = 0;
	
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card_to_check = ds_list_find_value(source.hand, c);
	
		if (card_to_check.name == "shield") {
			amount_of_shield_cards += 1;
		}
	}
	
	if (amount_of_shield_cards >= 2) {
		return true;
	}

	return false;
}