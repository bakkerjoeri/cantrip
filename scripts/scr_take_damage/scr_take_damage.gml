///scr_take_damage(character, damage);
var character = argument[0];
var damage = argument[1];

with (character) {
	damage_to_take = damage;
	state_switch("takingDamage");
}