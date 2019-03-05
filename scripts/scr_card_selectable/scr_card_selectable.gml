if (
	mouse_check_button_released(mb_left)
	&& instance_position(mouse_x, mouse_y, self)
	&& scr_get_top_object_under_mouse(obj_card_base) == self
) {	
	with (obj_battle_manager) {
		selected_card = other;
		state_switch("turnResolveAction");
	}
}