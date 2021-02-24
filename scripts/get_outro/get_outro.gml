function get_outro(boss) {
	if (boss == "crimson_mage") {
		return scr_choose_from_array([
			 "The Crimson Mage stares at you, first in disbelief, then with acceptance.\n\n\"Eternity... it lasted shorter than I would have hoped.\" She smiles faintly as her knees buckle and she sits down hard on the floor, the red of her eyes loses its color.\n\nThe sun is coming up, its glow casting a red tint onto her face. \"Would you care to enjoy my final sunrise with me?\"\n\nYou sit down beside her.",
		]);
	}
	
	if (boss == "lord_of_lightning") {
		return scr_choose_from_array([
			 "The lightning raging from his hands flickers out. The Lord of Lightning slumps to his knees, his eyes filled with hate, the yellow still pulsing, but his body too exhausted to act.\n\n\"You?!\" he asks, incredulous. \"How dare y-\" lightning strikes him once, twice, thrice over. He remains motionless. A rising sun dissipates the dark clouds overhead.\n\nYou can see clear, blue skies for miles around.",
		]);
	}
	
	if (boss == "void_priest") {
		return scr_choose_from_array([
			 "A seam opens, not in any wall, but in the middle space between you. Darkness starts pouring out.\n\nStatic grows in waves until it becomes unbearable, whispers turning into moans, then shouts, then screams, as it all envelops the Void Priest, gnashing, gnawing.\n\nThen it recedes into nothingness, the Void Priest no longer there. The crack in reality shuts for good.\n\nOutside you hear the first birds announce a new day."
		]);
	}
}
