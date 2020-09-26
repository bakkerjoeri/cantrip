function scr_choose_from_list(list) {
	if (ds_list_size(list) == 0) {
		return undefined;
	}
	
	var cloned_list = ds_list_create();
	ds_list_copy(cloned_list, list);
	ds_list_shuffle(cloned_list);
	return cloned_list[| 0];


}
