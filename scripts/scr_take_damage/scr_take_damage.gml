///scr_take_damage(character, damage);
function scr_take_damage(target, damage, source) {
	if (damage > 0) {
		with (target) {
			damage_to_take = damage;
			state_switch("takingDamage");
		}
	}
}
