function scr_card_definition_sneak_attack(card) {
	card.name = "sneak_attack";
	card.title = "sneak attack";
	card.cost = 2;
	card.text = "Do 2 damage, bypassing \"shield\" cards.";
	card.effect = do_sneak_attack_effect;
	card.damage = 2;
	card.rarity = 3;
	card.has_priority = check_priority_for_sneak_attack;
}

function do_sneak_attack_effect(target, source, card) {
	scr_take_damage(target, card.damage, source, {
		invert_discard_order: true,
	});
}

function check_priority_for_sneak_attack() {
	return true;
}