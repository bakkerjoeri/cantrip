function scr_create_list_from_array(array) {
	var array_size = array_length(array);
	var list = ds_list_create();
	
	for (var li = 0; li <= array_size - 1; li += 1) {
		var value = array_get(array, li);
		ds_list_set(list, li, value);
	}
	
	return list;
}