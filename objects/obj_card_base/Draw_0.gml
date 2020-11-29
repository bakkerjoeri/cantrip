draw_self();
draw_set_alpha(alpha);
image_alpha = alpha;

if (debug_mode) {
	draw_set_halign(fa_left);
	draw_set_color(global.palette_1);
	var offset = -12;
	var debug_text = state_name;
	
	if (instance_exists(obj_battle_manager)) {
		if (owner == obj_battle_manager.opponent) {
			offset = sprite_height + 4;
		}

		if (scr_does_list_contain_item(owner.hand, self.id)) {
			var hand_position = ds_list_find_index(owner.hand, self.id);
			debug_text += " " + string(hand_position);
		
			if (variable_instance_exists(self.id, "previous_hand_position") && self.previous_hand_position != hand_position) {
				debug_text += "/" + string(previous_hand_position);
			}
		}
	}
		
	draw_text(x, y + offset, debug_text);
}

if (is_face_up) {
	var line_height = 8;
	var cost_padding_top = 4;
	var cost_padding_left = 6;
	var title_padding_left = cost_padding_left + 5;
	var title_padding_right = title_padding_left;
	var title_padding_top = cost_padding_top;
	var text_padding_left = 4;
	var text_padding_right = text_padding_left;
	var text_start = title_padding_top + (3 * line_height);
	
	// Render cost
	if (!is_unplayable && variable_instance_exists(self.id, "cost")) {
		draw_set_color(global.palette_3);
		draw_set_halign(fa_center);
		draw_text(
			x + cost_padding_left,
			y + cost_padding_top,
			string(cost)
		);
	}
	
	// Render title
	draw_set_halign(fa_center);
	draw_set_color(global.palette_0);
	draw_text_ext(
		round(x + (sprite_width / 2)),
		y + title_padding_top,
		title,
		line_height,
		sprite_width - title_padding_left - title_padding_right
	);
	
	if (is_burning) {
		draw_set_color(global.palette_6);
		draw_set_halign(fa_left);
		draw_text_ext(
			x + text_padding_left,
			y + text_start,
			"Burning",
			line_height,
			sprite_width - text_padding_left - text_padding_right
		);
		text_start += line_height;
	}
	
	// Render keywords
	if (is_unplayable) {
		draw_set_color(global.palette_2);
		draw_set_halign(fa_left);
		draw_text_ext(
			x + text_padding_left,
			y + text_start,
			"Unplayable",
			line_height,
			sprite_width - text_padding_left - text_padding_right
		);
		text_start += line_height;
	}

	// Render card text
	draw_set_color(global.palette_0);
	draw_set_halign(fa_left);
	draw_text_ext(
		x + text_padding_left,
		y + text_start,
		text,
		line_height,
		sprite_width - text_padding_left - text_padding_right
	);
	
	// Render border
	if (border) {
		draw_set_color(border);
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
		var rarity_text = "";
		draw_set_halign(fa_center);
		
		if (rarity == 0) {
			draw_set_color(global.palette_4);
			rarity_text = "common";
		} else if (rarity == 1) {
			draw_set_color(global.palette_3);
			rarity_text = "uncommon";
		} else if (rarity == 2) {
			draw_set_color(global.palette_10);
			rarity_text = "rare";
		} else if (rarity == 3) {
			draw_set_color(global.palette_9);
			rarity_text = "loot";
		}
		
		draw_text(x + (sprite_width / 2), y + sprite_height + 4, rarity_text);
	}
}
draw_set_alpha(1);