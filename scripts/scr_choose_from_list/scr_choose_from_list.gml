///scr_choose_from_list(list);
var list = argument[0];
var list_size = ds_list_size(list);

if (list_size == 0) {
	return noone;
}

return ds_list_find_value(list, round(random(list_size - 1)));