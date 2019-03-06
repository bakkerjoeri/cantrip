///scr_card_effect_combust(target, source);
var source = argument[1];

scr_character_gains_ap(source, 1);
scr_character_draws_card(source);

with (obj_battle_manager) {
	state_switch("turnEnd");
}