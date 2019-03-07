///scr_character_take_damage(character, damage);
var character = argument[0];
var damage = argument[1];

if (damage > 0) {
	var undefended_damage = max(0, damage - character.defence);
	
	character.defence = max(0, character.defence - damage);
	
	for (var c = 1; c <= undefended_damage; c += 1) {
		var hand_size = ds_list_size(character.hand);
		
		if (hand_size > 0) {
			var card_to_discard = scr_choose_from_list(character.hand);

			ds_list_add(character.graveyard, card_to_discard);
			ds_list_delete(character.hand, ds_list_find_index(character.hand, card_to_discard));

			continue;
		}
		
		with (obj_battle_manager) {
			character_that_lost = character;
			state_switch("battleEnd");
		}
		
		break;
	}
}