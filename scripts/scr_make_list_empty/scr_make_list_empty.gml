function scr_make_list_empty(list) {
	while(ds_list_size(list) > 0) {
		ds_list_delete(list, 0);
	}
	
	return list;
}