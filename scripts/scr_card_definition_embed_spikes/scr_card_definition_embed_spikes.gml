function scr_card_definition_embed_spikes(card) {
	card.name = "embed_spikes";
	card.title = "embed spikes";
	card.cost = 1;
	card.text = "\"shield\" cards in your hand get \"when hit, do 1 damage\".";
	card.effect = do_embed_spikes_effect;
	card.condition = can_play_embed_spikes;
	card.rarity = 1;
}

function do_embed_spikes_effect(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (
			card.name == "shield"
			&& (!variable_instance_exists(card, "spiked") || card.spiked == false)
		) {
			card.text += " When hit, do 1 damage.";
			card.counter = spiked_shield_counter;
			card.spiked = true;
		}
	}
}

function spiked_shield_counter(target, source) {
	scr_take_damage(target, 1, source);
}

function can_play_embed_spikes(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (
			card.name == "shield"
			&& (!variable_instance_exists(card, "spiked") || card.spiked == false)
		) {
			return true;
		}
	}

	return false;
}