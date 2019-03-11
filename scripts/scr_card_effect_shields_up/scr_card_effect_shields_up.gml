/// scr_card_effect_shield_bash(target, source);
var source = argument[1];

repeat(3) {
	var shield_card = instance_create_layer((room_width / 2) - 32, (room_height / 2) - 48, "Instances", obj_card_shield);
	
	with (shield_card) {
		ds_list_add(source.hand, shield_card);
		owner = source;
		state_switch("beingDrawn");
	}	
}