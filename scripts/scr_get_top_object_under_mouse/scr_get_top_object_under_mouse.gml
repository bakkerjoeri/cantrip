var type = argument[0];

var top_object = noone;
var objects_under_mouse = ds_list_create();

with (type) {
	if (instance_position(mouse_x, mouse_y, self)) {
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