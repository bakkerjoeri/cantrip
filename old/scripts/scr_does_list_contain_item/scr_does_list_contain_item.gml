function scr_does_list_contain_item(list, item) {
	return ds_list_find_index(list, item) >= 0;
}