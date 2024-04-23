function scr_take_damage(target, damage, source) {
	if (argument_count >= 4) {
		var damage_options = argument[3];
	} else {
		var damage_options = {};
	}
	
	if (damage > 0) {
		with (target) {
			var damage_event = ds_map_create();
			damage_event[? "target"] = target;
			damage_event[? "source"] = source;
			damage_event[? "amount"] = damage;
			damage_event[? "damage_options"] = damage_options;
			ds_queue_enqueue(damage_events, damage_event);

			state_switch("takingDamage");
		}
	}
}
