function scr_create_array_from_list(list) {
	var list_size = ds_list_size(list);
	var array = array_create(list_size);
	
	for (var li = 0; li <= list_size - 1; li += 1) {
		var value = ds_list_find_value(list, li);
		array_set(array, li, value);
	}
	
	return array;
}