// Inherit the parent event
event_inherited();

pause_icon_sprite_index = 0;
if (
	instance_exists(obj_pause_controller)
	&& variable_instance_exists(obj_pause_controller, "state_name")
	&& obj_pause_controller.state_name == "paused"
) {
	pause_icon_sprite = spr_button_icon_resume;
} else {
	pause_icon_sprite = spr_button_icon_pause;
}