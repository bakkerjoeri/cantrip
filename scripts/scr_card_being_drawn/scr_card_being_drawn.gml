function scr_card_being_drawn() {
	audio_play_sound(sound_card, 1, false);
	state_switch("inHand");
}
