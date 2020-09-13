function scr_card_definition_forge() {
	var definition = {
		name: "forge",
		title: "forge",
		cost: 2,
		text: "increase damage of \"attack\" cards in your hand by 1.",
		effect: do_forge_effect,
		condition: can_play_forge,
	};
	
	return definition;
}

function do_forge_effect(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "attack") {
			if (!variable_instance_exists(card, "damage")) {
				card.damage = 1;
			}
			
			card.damage += 1;
			card.text = "Do " + string(card.damage) + " damage.";
			card.effect = forged_attack;
		}
	}
}

function forged_attack(target, source, card) {
	scr_take_damage(target, card.damage, source);
};

function can_play_forge(target, source) {
	for (var c = 0; c <= ds_list_size(source.hand) - 1; c += 1) {
		var card = ds_list_find_value(source.hand, c);
	
		if (card.name == "attack") {
			return true;
		}
	}

	return false;
}