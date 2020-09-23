function scr_concat_lists() {
	var total_list = ds_list_create();

	for (var i = 0; i < argument_count; i += 1) {
		var list = argument[i];
		
		for (var li = 0; li < ds_list_size(list); li += 1) {
			ds_list_add(total_list, ds_list_find_value(list, li));
		}
	}
	
	return total_list;
}