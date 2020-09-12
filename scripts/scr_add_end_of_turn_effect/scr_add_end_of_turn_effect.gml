function scr_add_end_of_turn_effect(character, name, effect_script, duration) {
	var effect_map = ds_map_create();

	effect_map[? "name"] = name;
	effect_map[? "effect"] = effect_script;
	effect_map[? "duration"] = duration;
	effect_map[? "source"] = character;

	ds_list_add(character.end_of_turn_effects, effect_map);
}
