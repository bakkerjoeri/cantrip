function scr_add_start_of_turn_effect(character, name, effect_script, duration, unique) {
	if (unique) {
		var effect_exists = false;

		for (var e = 0; e <= ds_list_size(character.start_of_turn_effects) - 1; e += 1) {
			var start_of_turn_effect = ds_list_find_value(character.start_of_turn_effects, e);

			if (start_of_turn_effect[? "name"] == name) {
				start_of_turn_effect[? "duration"] = duration;
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

	ds_list_add(character.start_of_turn_effects, effect_map);
}
