///state_create(name <string>,step_script <script>)
function state_create() {
	ds_map_replace(state_map,argument[0],argument[1]);
	ds_map_replace(state_keys,argument[1],argument[0]);


}
