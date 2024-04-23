function scr_choose_from_list(list) {
	var list_length = ds_list_size(list);
	
	if (list_length == 0) {
		return undefined;
	}
	
	return ds_list_find_value(list, irandom(list_length - 1));
}
