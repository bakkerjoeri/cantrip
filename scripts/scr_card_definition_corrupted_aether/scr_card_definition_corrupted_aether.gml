function scr_card_definition_corrupted_aether(card) {
	card.name = "corrupted_aether";
	card.title = "corrupted aether";
	card.cost = 1;
	card.text = "Do damage equal to your foe's AP.";
	card.effect = do_corrupted_aether_effect;
	card.condition = can_play_corrupted_aether;
	card.rarity = 0;
	card.has_priority = check_priority_for_corrupted_aether;
}

function do_corrupted_aether_effect(target, source) {
	scr_add_event_log("Blue sparks cascade as the air around " + target.name + " crackles, their power turning on themselves.");
	
	scr_take_damage(target, target.ability_points, source);
}

function can_play_corrupted_aether(target, source) {
	return target.ability_points > 0;
}

function check_priority_for_corrupted_aether(target) {
	if (target.ability_points >= 2) {
		return true;
	}

	return false
}