var type = argument[0];
var offset_top = 0;
var offset_right = 0;
var offset_bottom = 0;
var offset_left = 0;

if (argument_count >= 2) {
	offset_top = argument[1];
}

if (argument_count >= 3) {
	offset_right = argument[2];
}

if (argument_count >= 2) {
	offset_bottom = argument[3];
}

if (argument_count >= 3) {
	offset_left = argument[4];
}

var top_object = noone;
var objects_under_mouse = ds_list_create();

with (type) {
	if (
		(self.bbox_top - offset_top) <= mouse_y &&
		(self.bbox_bottom + offset_bottom) >= mouse_y &&
		(self.bbox_left - offset_left) <= mouse_x &&
		(self.bbox_right + offset_right) >= mouse_x
	) {
		ds_list_add(objects_under_mouse, id);
	}
}

for (var c = 0; c <= ds_list_size(objects_under_mouse) - 1; c += 1) {
	var object_to_inspect = ds_list_find_value(objects_under_mouse, c);
	
	if (
		!top_object
		|| (object_to_inspect.depth < top_object.depth)
	) {
		top_object = object_to_inspect;
    }
}

ds_list_destroy(objects_under_mouse);

return top_object;