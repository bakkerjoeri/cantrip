var draw_top_offset = y;

if (
	obj_game_manager.prefers_display_timer
	|| room == room_victory
	|| room == room_game_over
) {
	draw_set_halign(fa_left);
	draw_set_color(global.palette_1);
	draw_text(x + 96 - string_width("000:00"), draw_top_offset, scr_create_timestamp(obj_game_manager.run_duration));
	
	draw_top_offset += 16;
}

var active_custom_rules = [];

if (obj_game_manager.game_mode == "draft") {
	array_push(active_custom_rules, "Sealed deck");
}

if (obj_game_manager.perks.clairvoyant) {
	array_push(active_custom_rules, "Clairvoyant");
}

if (obj_game_manager.perks.forbidden_alchemy) {
	array_push(active_custom_rules, "Forbidden alchemy");
}

if (obj_game_manager.perks.supermoon) {
	array_push(active_custom_rules, "Supermoon");
}

if (obj_game_manager.perks.vampires_curse) {
	array_push(active_custom_rules, "Vampire's curse");
}

if (array_length(active_custom_rules) > 0) {
	draw_set_halign(fa_left);
	draw_set_color(global.palette_1);
	draw_text(x, draw_top_offset, "Custom rules:");
	
	draw_top_offset += 8;

	for (var c = 0; c < array_length(active_custom_rules); c += 1) {
		draw_text(x, draw_top_offset, "- " + active_custom_rules[c]);
		draw_top_offset += 8;
	}
}