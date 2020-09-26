if (is_face_up) {
	sprite_index = spr_card_background;
	
	if (rarity == 0) {
		image_index = 0;
	}
	
	if (rarity == 1) {
		image_index = 1;
	}
	
	if (rarity == 2) {
		image_index = 2;
	}
	
	if (rarity == 3) {
		image_index = 3;
	}
} else {
	sprite_index = spr_card_backside;
}