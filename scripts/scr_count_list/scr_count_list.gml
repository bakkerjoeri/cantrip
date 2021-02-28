function scr_count_list(list, value) {
	var found = 0;
	var size = ds_list_size(list);
	
	for(var i = 0; i < size; i++ ) {
		if (ds_list_find_value(list, i) == value) {
			found++;
		}
	}
	
	return found;
}