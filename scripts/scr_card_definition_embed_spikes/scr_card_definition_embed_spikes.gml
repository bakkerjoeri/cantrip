function scr_card_definition_embed_spikes() {
	var definition = {
		name: "embed_spikes",
		title: "embed spikes",
		cost: 1,
		text: "\"shield\" cards in your hand get \"when hit, do 1 damage\".",
		effect: do_embed_spikes_effect,
		condition: can_play_embed_spikes,
	};
	
	return definition;
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