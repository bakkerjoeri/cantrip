function scr_character_gains_ap(character, amount) {
	var amount_gained = min(amount, character.max_ability_points - character.ability_points);
	character.ability_points += amount_gained;
	
	if (
		amount_gained > 0
		&& scr_does_list_contain_item(character.active_effects, "poison_the_well")
	) {
		scr_take_damage(character, amount_gained, character);
		scr_add_event_log(character.name + " gains AP, but suddenly feels sick.");
	}
}
