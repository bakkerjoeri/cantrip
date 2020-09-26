function scr_clone_list(list) {
	var cloned_list = ds_list_create();

	ds_list_copy(cloned_list, list);

	return list;
}