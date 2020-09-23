function scr_remove_item_from_list(list, item){
	ds_list_delete(list, ds_list_find_index(list, item));
}