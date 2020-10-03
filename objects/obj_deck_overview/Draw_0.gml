draw_set_halign(fa_left);
draw_set_color(global.palette_1);
draw_text(x + 1, y, "Deck of " + string(ds_list_size(obj_game_manager.player_deck_list)) + " cards");

for (var r = 0; r <= ds_grid_height(deck_overview_grid) - 1; r += 1) {
	var vertical_offset = 8 + (r * 8)
	var amount_of_cards = ds_grid_get(deck_overview_grid, 0, r);
	var card_instance = ds_grid_get(deck_overview_grid, 4, r);
	
	if (amount_of_cards > 1) {
		draw_set_halign(fa_right);
		draw_set_color(global.palette_2);
		draw_text(x + 10, y + vertical_offset, string(amount_of_cards) + "x");
	}

	if (variable_instance_exists(card_instance, "cost")) {
		draw_set_halign(fa_center);
		draw_set_color(global.palette_3);
		draw_text(x + 18, y + vertical_offset, string(card_instance.cost));
	}

	draw_set_halign(fa_left);
	
	if (mouse_on_row == r) {
		draw_set_color(global.palette_4);
	} else {
		draw_set_color(global.palette_1);
	}
	
	draw_text(x + 26, y + vertical_offset, card_instance.title);
}