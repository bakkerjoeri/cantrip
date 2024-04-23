function scr_move_item_between_lists(item, from, to) {
	scr_remove_item_from_list(from, item);
	ds_list_add(to, item);
}