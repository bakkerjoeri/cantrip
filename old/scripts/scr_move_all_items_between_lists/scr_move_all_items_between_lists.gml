function scr_move_all_items_between_lists(from, to) {
	while (!ds_list_empty(from)) {
		scr_move_item_between_lists(ds_list_find_value(from, 0), from, to);
	}
}