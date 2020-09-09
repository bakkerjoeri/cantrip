function state_execute() {
	if(script_exists(state)) {
		script_execute(state)
 
		state_executed_previously = state;
	} else {
		 state_switch(ds_map_find_first(state_map));
	}


}
