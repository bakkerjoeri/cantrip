// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_play_sound_effect(sound_id) {
	if (!obj_game_manager.prefers_sounds) {
		return;
	}
	
	if (!audio_exists(sound_id)) {
		return;
	}
	
	audio_play_sound(sound_id, 1, false);
}