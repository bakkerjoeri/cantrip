///scr_choose_from_list(list);
function scr_choose_from_list() {
	var list = argument[0];

	if (ds_list_size(list) == 0) {
		return undefined;
	}

	ds_list_shuffle(list);
	return list[| 0];


}
