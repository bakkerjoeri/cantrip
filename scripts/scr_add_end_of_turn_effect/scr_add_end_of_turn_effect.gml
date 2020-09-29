function scr_add_end_of_turn_effect(character, name, effect_script, duration, unique) {
	if (unique) {
		var effect_exists = false;

		for (var e = 0; e <= ds_list_size(character.end_of_turn_effects) - 1; e += 1) {
			var end_of_turn_effect = ds_list_find_value(character.end_of_turn_effects, e);
		
			if (end_of_turn_effect[? "name"] == name) {
				end_of_turn_effect[? "duration"] = duration;
				effect_exists = true;
			}
		}
	
		if (effect_exists) {
			return;
		}
	}
	
	var effect_map = ds_map_create();

	effect_map[? "name"] = name;
	effect_map[? "effect"] = effect_script;
	effect_map[? "duration"] = duration;
	effect_map[? "source"] = character;

	ds_list_add(character.end_of_turn_effects, effect_map);
}
