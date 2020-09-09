/// scr_add_start_of_turn_effect(character, name, effect_script, duration);
function scr_add_start_of_turn_effect() {

	var character = argument[0];
	var name = argument[1];
	var effect_script = argument[2];
	var duration = argument[3];

	var effect_map = ds_map_create();

	effect_map[? "name"] = name;
	effect_map[? "effect"] = effect_script;
	effect_map[? "duration"] = duration;

	ds_list_add(character.start_of_turn_effects, effect_map);


}
