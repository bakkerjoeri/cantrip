state_execute();

var card_under_mouse = scr_get_top_object_under_mouse(obj_card_base, 20, 0, 20, 0);

if (card_under_mouse) {
	obj_battle_manager.card_with_focus = card_under_mouse;
} else {
	obj_battle_manager.card_with_focus = noone;
}