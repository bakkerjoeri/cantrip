function get_intro_for_enemy(enemy, floors) {
	if (enemy == "gerblin") {
		return scr_choose_from_array([
			"A few not-so-subtle rustling leaves and snapping branches made you suspect something is following you.\n\nYour suspicions are confirmed as a loudly yelping gerblin jumps out of the bushes and runs for you.",
			"As you finish eating your rations, you freeze as you notice pair of eyes staring at you from the nearby bush. You slowly try to get up, but out jumps a gerblin, their weapon drawn.",
			"You hear the gerblin screams before you see them. For about a full minute, that is. When they finally arrive, panting, they draw their weapon.",
		]);
	}
	
	if (enemy == "kobold") {
		return scr_choose_from_array([
			"You've been nervously spotting and avoiding traps for a few miles now.\n\nFinally, the kobold you expected steps out into the open for a face-to-face confrontation.",
			"You spot a gilded chest sitting smack-dab in the middle of the forest floor. Instinctively you reach to open it, but then think better of it.\n\nYou look up to see that a kobold has drawn near while you were distracted.",
			"From behind some dense bush you spot a kobold tinkering with a gilded chest, connecting this wire to that. You try to sneak by, but a branch snaps under your feet.\n\nThe kobold turns around, startled, and spots you.",
		]);
	}
	
	if (enemy == "cave_spider") {
		return scr_choose_from_array([
			"A sharp hiss shocks you into focus.\n\nYou look around and find strange webbing hanging from the trees. You realise you walked right into a spider's nest.\n\nThe hissing grows louder...",
			"As you go deeper, the trees around you, more and more, are covered with thick strands of webbing.\n\n\"Ugh, spiders,\" you think to yourself, \"I can't stand spiders.\"\n\nYour loathing thoughts are interrupted as a spider, considerably bigger than you were imagining, lets itself down from the treetops right in front of you.\n\nIt hisses at you and gets ready to pounce.",
		]);
	}
	
	if (enemy == "warrior") {
		return scr_choose_from_array([
			"As you approach the ruined village's gate, you see a knight bearing a spear standing sentinel.\n\n\"No further, stranger. This place is not for you.\"\n\nTheir voice sounds... strange...\n\nYou keep moving toward them. They level their spear at you.",
		]);
	}
	
	if (enemy == "hunter") {
		return scr_choose_from_array([
			"Something narrowly misses your face.\n\nAn arrow!\n\nYou look for its source and find a hunter on a nearby hill, a grin on their face. This one likes to toy with its mark.\n\nYou draw your weapon as they pull their bowstring taught once more.",
		]);
	}
	
	if (enemy == "mad_chemist") {
		return scr_choose_from_array([
			"You spot a shabby hut. As soon as you enter, you realise your mistake. Someone shuts the door behind you and you wheel around to face them.\n\n\"Ha-have you come to take part in my experiments?\" They wildly gesture at you with a beaker filled with a violently swirling liquid.\n\n\"Come see what I've made!\"",
		]);
	}
	
	if (enemy == "rogue") {
		return scr_choose_from_array([
			"You have the feeling you're being followed, but your attempts to figure out who come up empty.\n\nIn your distraction, you wander into a dim alleyway. You turn around just in time to see a hooded figure dropping down from the roof of an adjacent building.\n\nThey swiftly approach you.",
		]);
	}
	
	if (enemy == "adventurer") {
		var first_floor = ds_list_find_value(floors, 0);
		var random_room = scr_choose_from_list(first_floor[? "rooms"]);
		var enemy_name = random_room[? "enemy"][? "name"];
		
		var final_floor = ds_list_find_value(floors, ds_list_size(floors) - 1);
		var final_room = ds_list_find_value(final_floor[? "rooms"], ds_list_size(final_floor[? "rooms"]) - 1);
		var final_boss = final_room[? "enemy"][? "id"];
		var botched_name = "the baddie";
		var confusion = "You don't look like they said you would..."
		
		if (final_boss == "crimson_mage") {
			botched_name = "the Crimson King";
			confusion = "Although your outfit doesn't look all that red to me. What happened? Forgot your costume?";
		}
		
		if (final_boss == "void_cardinal") {
			botched_name = "Mister Void";
			confusion = "I figured you'd have some demons with you, but I guess I got lucky.";
		}
		
		if (final_boss == "ancient_wizard") {
			botched_name = "Thunderman";
			confusion = scr_choose_from_array([
				"Huh, they told me your eyes were yellow, but... Wait, did I catch you without your contacts in?",
				"Thank the heavens for the clear skies, eh? Haha!\" You stare back, silent. \"Jeez, tough crowd huh? I guess they were wrong about your love of puns.\"",
			]);
		}
		
		return "\"Hey! Hey you!\" You turn around and see someone approaching you, grimy from long travel.\n\n\"You're the one terrorising my village, aren't you? The one called " + botched_name + ", or something? " + confusion + ".\n\n\"Uhm, that's not me,\" you reply, \"but I think we might be looking for the same person.\"\n\nThey laugh smugly. \"Hah, yeah right, after I saw what you did to that " + enemy_name + ", you think I'd believe you're a mere quester? Have at you, fiend!\"\n\nYou sigh and ready yourself.";
	}
	
	if (enemy == "necromancer") {
		var speech = scr_choose_from_array([
			"\"Huh... I can't very well experiment with live specimen.\" As they lift their hands, the ground begins to stir...\n\n\"We'll have to do something about that, don't we?\"",
			"\"Aah, so you're responsible for all those fresh bodies.\" As they lift their hands, the ground begins to stir...\n\n\"I do thank you, but I think I still require more.\"",
			"\"The one you hunt... I need you to stop.\" As they lift their hands, the ground begins to stir...\n\n\"Who else do you think provides me with the materials for my work?\"",
		]);
		
		return "You find yourself surrounded by headstones and makeshift crosses, the dirt beneath your feet recently overturned. A cold voice rings out:\n\n" + speech;
		
	}
	
	if (enemy == "warlock") {
		return scr_choose_from_array([
			"You push open the door of the town hall.\n\n\"Oh how fun,\" a figure dressed in a purple robe lilts, lit by what must be a thousand candles lining inner walls, \"a witness to my summoning!\"\n\nBehind them a summoning circle is drawn in mauve chalk. A crimson mass lies in the middle.\n\n\"Or... ah yes, I could use in... other ways.\" The door shuts suddenly behind you.\n\n\"Come forth, now. You shall be part of something grand!\"",
		]);
	}
	
	if (enemy == "mind_flayer") {
		var first_floor = ds_list_find_value(floors, 0);
		var final_room = ds_list_find_value(first_floor[? "rooms"], ds_list_size(first_floor[? "rooms"]) - 1);
		var first_floor_boss_name = final_room[? "enemy"][? "name"];

		var reason_for_constitution = scr_choose_from_array([
			"Luckily, you rolled an 18 on your constitution saving throw",
			"You concentrate on your arm and order it to stop"
		]);

		return "As you enter the town hall, a voice whispers in your head.\n\n\"Why hello, brave one... Ah, it was you who challenged my " + first_floor_boss_name + "! Yes, yes, you will do quite nicely.\"\n\nWith a shock you realise your arm has started moving of its own accord. " + reason_for_constitution + " and manage to resist.\n\nYou look around to find the mind's intruder. Their white eyes gaze into you from their tentacled face.\n\nThey whisper into your thoughts once more: \"I will have you yet, brave one.\"";
	}
	
	if (enemy == "wyvern") {
		return scr_choose_from_array([
			"Your footsteps echo as you enter a cavernous chamber. Atop a massive gargoyle is perched a winged beast. They snarl fire and snap their jaw at you before they drop into flight, soaring in your direction.",
		]);
	}
	
	if (enemy == "witch") {
		return scr_choose_from_array([
			"The windows are taller here. Through them you observe the moon. It looks bigger than before... brighter even?\n\n\"Beautiful, isn't she?\" a voice speaks from behind you. A figure wearing a gown shimmering with the moonlight emerges. \"You know you never should have come here.\" She casts her gaze toward the moon, and continues wistfully \"Especially not tonight...\"\n\n\"I'm sorry for what is about to happen.\"",
		]);
	}
	
	if (enemy == "blacksmith") {
		return scr_choose_from_array([
			"A knight bearing a shield almost as tall as they are steps slowly into your path. The shield connects to the floor with a heavy thud as they block further passage.",
		]);
	}
	
	if (enemy == "ancient_wizard") {
		return scr_choose_from_array([
			"The sky darkens and wind tries to throw you off-balance as you climb the final steps onto the roof of the open tower.\n\nThe Lord of Lightning looks down on you with his piercing yellow eyes.\n\n\"Oh my, look who it is! I am *shocked* that you made it this far! Haha get it? Now, then! Let's battle, shall we? I do expect it will be spectacular.\"\n\nHis hands start to crackle with energy.",
		]);
	}
	
	if (enemy == "void_cardinal") {
		return scr_choose_from_array([
			"Whispers of unknown origin fill your head as you enter their chambers. The Void Priest turns to you.\n\n\"Ah, you have come to witness the awakening, I suppose? You are just in time.\"\n\n\"Let us begin.\"",
		]);
	}
	
	if (enemy == "crimson_mage") {
		return scr_choose_from_array([
			"The stained glass windows turn the moonlight a bright red. The Crimson Mage, enveloped in a billowing satin robe, observes you as you enter.\n\n\"You, your life, your journey... What a waste of time and blood.\" She sighs deeply, her eyes start glowing a deep red.\n\n\"I think I will claim what remains of you. It will be in much better hands.\"",
		]);
	}
}
