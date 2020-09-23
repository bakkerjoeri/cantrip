function scr_take_damage(target, damage, source) {
	if (argument_count >= 4) {
		var invert_discard_order = argument[3];
	} else {
		var invert_discard_order = false;
	}
	
	if (damage > 0) {
		with (target) {
			var damage_event = ds_map_create();
			damage_event[? "target"] = target;
			damage_event[? "source"] = source;
			damage_event[? "amount"] = damage;
			damage_event[? "invert_discard_order"] = invert_discard_order;
			ds_queue_enqueue(damage_events, damage_event);

			state_switch("takingDamage");
		}
	}
}
