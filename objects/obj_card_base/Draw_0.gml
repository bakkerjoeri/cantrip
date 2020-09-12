draw_self();

if (is_face_up) {
	var padding = 5;
	var text_offset = 38;
	
	draw_set_halign(fa_left);
	
	if (debug_mode) {
		draw_set_color(global.palette_1);
		draw_text(x, y - 12, state_name + " (" + string(depth) + ")");
	}
	
	draw_set_halign(fa_center);
	draw_set_color(global.palette_0);
	draw_text_ext(x + sprite_width / 2, y + padding, title, 8, sprite_width - (2 * padding) - 12);

	if (!is_unplayable) {
		draw_set_color(global.palette_3);
		draw_set_halign(fa_center);
		draw_text(x + padding + 2, y + padding, string(cost));
	}
	
	if (is_unplayable) {
		draw_set_color(global.palette_2);
		draw_set_halign(fa_left);
		draw_text_ext(x + padding, y + 38, "Unplayable", 8, sprite_width - (2 * padding));
		text_offset += 8;
	}

	draw_set_color(global.palette_0);
	draw_set_halign(fa_left);
	draw_text_ext(x + padding, y + text_offset, text, 8, sprite_width - (2 * padding));
	
	if (
		state_name == "inHand"
		&& owner.state_name == "deciding"
		&& obj_battle_manager.state_name == "turnPlayPhase"
		&& obj_battle_manager.turn_of_character == owner
		&& scr_can_character_play_card(owner, self.id)
	) {
		draw_set_color(global.palette_4);
		draw_rectangle(x - 1, y - 1, x + sprite_width, y + sprite_height, true);
		draw_set_alpha(0.6);
		draw_rectangle(x - 2, y - 2, x + sprite_width + 1, y + sprite_height + 1, true);
		draw_set_alpha(1);
	}
	
	if (
		state_name == "draftable"
		&& obj_draft_manager.state_name == "awaitPick"
		&& obj_draft_manager.card_with_focus == self.id
	) {
		draw_set_color(global.palette_4);
		draw_rectangle(x - 1, y - 1, x + sprite_width, y + sprite_height, true);
		draw_set_alpha(0.6);
		draw_rectangle(x - 2, y - 2, x + sprite_width + 1, y + sprite_height + 1, true);
		draw_set_alpha(1);
	}
}
