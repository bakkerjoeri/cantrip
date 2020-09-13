function scr_take_damage(target, damage, source) {
	if (damage > 0) {
		with (target) {
			var damage_event = ds_map_create();
			damage_event[? "target"] = target;
			damage_event[? "source"] = source;
			damage_event[? "amount"] = damage;
			ds_queue_enqueue(damage_events, damage_event);

			state_switch("takingDamage");
		}
	}
}
