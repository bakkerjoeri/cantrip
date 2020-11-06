// Update deck list
var previous_deck_size = ds_list_size(previous_deck_list);
var current_deck_size = ds_list_size(obj_game_manager.player_deck_list);

if (previous_deck_size != current_deck_size) {
	// Destroy the existing grid and instances
	if (ds_grid_height(deck_overview_grid) > 0) {
		for (var r = 0; r <= ds_grid_height(deck_overview_grid) - 1; r += 1) {
			var card_instance = ds_grid_get(deck_overview_grid, 4, r);
			instance_destroy(card_instance, true);
		}
		
		ds_grid_destroy(deck_overview_grid);
		deck_overview_grid = ds_grid_create(6, 0);
	}
	
	// Create a new grid
	for (var c = 0; c <= ds_list_size(obj_game_manager.player_deck_list) - 1; c += 1) {
		var card_name = ds_list_find_value(obj_game_manager.player_deck_list, c);
		
		if (
			ds_grid_height(deck_overview_grid) == 0
			|| !ds_grid_value_exists(deck_overview_grid, 2, 0, 2, ds_grid_height(deck_overview_grid) - 1, card_name)
		) {
			var card_instance = scr_create_card(card_name);
			card_instance.visible = false;
			
			var card_cost = -1;
			
			if (variable_instance_exists(card_instance, "cost")) {
				card_cost = card_instance.cost;
			}
			
			var first_character_weight = ord(string_char_at(card_instance.title, 1)) - ord("a") + 1;
			var second_character_weight = ord(string_char_at(card_instance.title, 2)) - ord("a") + 1;
			var sort_weight = (card_cost * 100000) + (first_character_weight * 100) + (second_character_weight);
			
			ds_grid_resize(deck_overview_grid, ds_grid_width(deck_overview_grid), ds_grid_height(deck_overview_grid) + 1);
			
			ds_grid_set(deck_overview_grid, 0, ds_grid_height(deck_overview_grid) - 1, 1);
			ds_grid_set(deck_overview_grid, 1, ds_grid_height(deck_overview_grid) - 1, card_cost);
			ds_grid_set(deck_overview_grid, 2, ds_grid_height(deck_overview_grid) - 1, card_name);
			ds_grid_set(deck_overview_grid, 3, ds_grid_height(deck_overview_grid) - 1, card_instance.title);
			ds_grid_set(deck_overview_grid, 4, ds_grid_height(deck_overview_grid) - 1, card_instance);
			ds_grid_set(deck_overview_grid, 5, ds_grid_height(deck_overview_grid) - 1, sort_weight);
		} else {
			for (var r = 0; r <= ds_grid_height(deck_overview_grid) - 1; r += 1) {
				var card_in_row = ds_grid_get(deck_overview_grid, 2, r);
				
				if (card_in_row == card_name) {
					var current_amount =  ds_grid_get(deck_overview_grid, 0, r);
					ds_grid_set(deck_overview_grid, 0, r, current_amount + 1);
				}
			}
		}
	}
	
	ds_grid_sort(deck_overview_grid, 5, true);
}

ds_list_destroy(previous_deck_list);

previous_deck_list = scr_clone_list(obj_game_manager.player_deck_list);

// Find highlighted row
if (
	mouse_x >= 0
	&& mouse_x <= 140
	&& mouse_y >= y + 8
) {
	mouse_on_row = floor((mouse_y - (y + 8)) / 8);
} else {
	mouse_on_row = -1;
}

for (var r = 0; r <= ds_grid_height(deck_overview_grid) - 1; r += 1) {
	var card_instance = ds_grid_get(deck_overview_grid, 4, r);
	card_instance.visible = false;
}

if (
	mouse_on_row >= 0
	&& mouse_on_row <= ds_grid_height(deck_overview_grid) - 1
)  {
	var card_instance = ds_grid_get(deck_overview_grid, 4, mouse_on_row);
	card_instance.x = x + 60;
	card_instance.y = clamp(y + 8 + (mouse_on_row * 8), 0, room_height - card_instance.sprite_height);
	card_instance.depth = -100;
	card_instance.visible = true;
}