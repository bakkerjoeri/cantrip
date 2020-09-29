draw_self();

if (debug_mode) {
	draw_set_halign(fa_left);
	draw_set_color(global.palette_1);
	var offset;
	var debug_text = state_name;
		
	if (owner == obj_battle_manager.player) {
		offset = -12;
	} else {
		offset = sprite_height + 4;
	}

	if (scr_does_list_contain_item(owner.hand, self.id)) {
		var hand_position = ds_list_find_index(owner.hand, self.id);
		debug_text += " " + string(hand_position);
		
		if (variable_instance_exists(self.id, "previous_hand_position") && self.previous_hand_position != hand_position) {
			debug_text += "/" + string(previous_hand_position);
		}
	}
		
	draw_text(x, y + offset, debug_text);
}

if (is_face_up) {
	var padding = 5;
	var line_height = 8;
	var text_offset = 30;
	
	draw_set_halign(fa_center);
	draw_set_color(global.palette_0);
	draw_text_ext(x + sprite_width / 2, y + padding, title, 8, sprite_width - (2 * padding) - 12);

	if (!is_unplayable && variable_instance_exists(self.id, "cost")) {
		draw_set_color(global.palette_3);
		draw_set_halign(fa_center);
		draw_text(x + padding + 2, y + padding, string(cost));
	}
	
	if (is_unplayable) {
		draw_set_color(global.palette_2);
		draw_set_halign(fa_left);
		draw_text_ext(x + padding, y + text_offset, "Unplayable", line_height, sprite_width - (2 * padding));
		text_offset += line_height;
	}

	draw_set_color(global.palette_0);
	draw_set_halign(fa_left);
	draw_text_ext(x + padding, y + text_offset, text, line_height, sprite_width - (2 * padding));
	
	if (
		state_name == "inHand"
		&& owner.state_name == "deciding"
		&& owner.is_controlled_by_player
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
