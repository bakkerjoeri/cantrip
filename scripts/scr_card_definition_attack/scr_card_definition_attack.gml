function scr_card_definition_attack(card) {
	card.name = "attack";
	card.title = "attack";
	card.cost = 1;
	card.text = "Do 1 damage.";
	card.effect = do_attack_effect;
	card.damage = 1;
	card.rarity = 0;
}

function do_attack_effect(target, source, card) {
	scr_take_damage(target, card.damage, source);
}
