function scr_remove_item_from_list(list, item){
	var index_of_item = ds_list_find_index(list, item);
	
	if (index_of_item >= 0) {
		ds_list_delete(list, index_of_item);
	}
	
	return list;
}