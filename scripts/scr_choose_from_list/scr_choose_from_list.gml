///scr_choose_from_list(list);
var list = argument[0];
var list_size = ds_list_size(list);

return ds_list_find_value(list, round(random(list_size - 1)));