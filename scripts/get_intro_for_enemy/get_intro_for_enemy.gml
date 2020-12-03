function get_intro_for_enemy(enemy, floors, current_room_number, deck_list) {
	if (enemy == "gerblin") {
		return scr_choose_from_array([
			"A gerblin has been following you for a few minutes now, hurrying from bush to bush, clearly still thinking you have not spotted it.\n\nJust as you wonder again if it will ever attack, it jumps out at you with a yelp.",
			"You sit down on a tree stump and take out your rations.\n\nAs soon as you take your first bite, you notice a gerblin. It eyes your food, then looks up at you, slowly brandishing its weapon.",
			"Distracted, you walk into a gerblin munching on a rodent. Its eyes grow wide as it looks up at you. It licks its lips, throws the remains to the ground and approach you, weapon drawn.\n\nThe main course has arrived.",
		]);
	}
	
	if (enemy == "kobold") {
		return scr_choose_from_array([
			"You've been nervously spotting and avoiding traps for a few miles now.\n\nWith some relief you finally see the culprit, a tall kobold, step out from behind the trees for a final face-to-face confrontation.",
			"You spot a gilded chest sitting smack-dab in the middle of the forest floor. Instinctively you reach to open it, but then think better of it.\n\nYou look up to see a kobold nearby, eagerly waiting for you to spring its trap. Now that you've failed to do so, it decides on a more direct course of action.",
			"From behind a dense bush you spot a kobold tinkering with a gilded chest, connecting this wire to that. You try to sneak by, but a branch snaps under your feet.\n\nThe kobold turns around, startled, and rushes for you.",
		]);
	}
	
	if (enemy == "cave_spider") {
		return scr_choose_from_array([
			"A sharp hiss shocks you into focus.\n\nYou look around and find strange webbing hanging from the trees. You realise you walked right into a spider's nest.\n\nThe hissing grows louder...",
			"As you go deeper, the trees around you, more and more, are covered with thick strands of webbing.\n\n\"Ugh, spiders,\" you think to yourself, \"I can't stand spiders.\"\n\nYour loathing thoughts are interrupted as, what else, a spider, considerably bigger than the one you were imagining, lets itself down from the treetops right in front of you.\n\nIt hisses at you and gets ready to pounce.",
			"As you move along, you hear a squish from under your foot.\n\nGrossed out, you find that you stepped on a pretty big spider. While you're busy scraping it off, you hear an angry hissing behind you.\n\nYou wheel around to find a much bigger spider, ready to pounce.",
		]);
	}
	
	if (enemy == "warrior") {
		var intro = "As you approach the ruined village's gate, you see a tall knight bearing a spear standing sentinel.\n\n";
		var will_face_mind_flayer = run_has_enemy(floors, "mind_flayer");
		
		if (will_face_mind_flayer) {
			intro += "\"Hello, brave one,\" their voice floats over to you in an odd whisper. \"I have been watching you. I watch you now, from this one's eyes.\" The knight points at themself, seemingly with some difficulty... Their movement seems not quite their own. \"Let's find out what you can do!\"\n\n";
		} else {
			intro += "\"You have gone far enough, peasant. You can either turn back, or face me. Either way, you will not reach the tower beyond.\"\n\n";
		}
		
		intro += "They level their spear at you.";
		
		return intro;
	}
	
	if (enemy == "hunter") {
		var intro = "";
		
		if (scr_does_list_contain_item(deck_list, "shields_up")) {
			intro += "In a reflex, you raise your shield, just in time to stop an arrow in its trajectory. ";
		} else {
			intro += "As you move towards the entrance of the village ruins, something narrowly misses your face. ";
		}
		
		intro += "You look for its source and find a hunter on a nearby hill, a grin on her face.\n\n";
		
		if (run_has_enemy(floors, "kobold")) {
			intro += "\"That kobold you bested was my mark, traveler. But no matter. A clever prey such as yourself will make for a much more interesting hunt! Prepare yourself!\"";
		} else {
			intro += "This one likes to toy with its mark. You draw your weapon as she pulls her bowstring taught once more.";
		}
		
		return intro;
	}
	
	if (enemy == "mad_chemist") {
		var intro = "As soon as you enter the shabby hut you realise your mistake. Someone shuts the door behind you.\n\n";
		
		intro += scr_choose_from_array([
			"\"Ha-have you come to take part in my experiments?\" They wildly gesture at you with a beaker filled with a violently swirling liquid.\n\n\"Come see what I've made!\"",
			"\"What a pleasant surprise. Ever since I was exiled from the tower, I've had to experiment on mere gerblins. Come, le-let's find out what happens to you!\" they say as they gesture a beaker filled with liquid your way,\n\n\"What happens to you when things go boom! Ha-haha!\"",
		]);
		
		return intro;
	}
	
	if (enemy == "rogue") {
		var intro =  scr_choose_from_array([
			"You are suddenly aware of a presence behind you. You turn to see a figure in a dark, hooded cloak. How did she get so close without you noticing earlier?\n\n",
			"In the darkness between two tall houses, a hooded figure drops down from the roof.\n\n",
			"You have the feeling you're being followed. Shadows flit. Suddenly, out of a dark corner, a cloaked figure emerges.\n\n",
		]);
		
		if (obj_game_manager.runs_won >= 4) {
			intro += "Her eyes are filled with hate. \"This village... this was where I lived.\"\n\nYou reply: \"I'm so sorry. We share a fate then. I am looking for the one who did this.\"\n\n\"I know you are. It's why I'm here. The contract on your head... I needed a way to start again.\"\n\nYou eye her with pity. \"Wouldn't you rather help me instead?\"\n\n\"Are you serious? Have you seen what's left of this village? What do you think they'll do to us? No. I'm sorry. This has to happen.\"\n\n";
		} else if (obj_game_manager.runs_won >= 2) {
			intro += "Her eyes are full of sorrow. \"I truly am sorry for this, but it's my only way out.\"\n\n";
		} else if (obj_game_manager.runs_won >= 0) {
			intro += "Her eyes meet yours. They are determined. \"This has to be done.\"\n\n";
		}
		
		intro += "The rogue draws their dagger.";
		
		return intro;
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
			botched_name = "the Crimson Juggler";
			confusion = "Although your outfit doesn't look all that red to me. What happened? Forgot your costume?";
		}
		
		if (final_boss == "void_priest") {
			botched_name = "Mister Void";
			confusion = "I figured you'd have some demons with you, but I guess I got lucky.";
		}
		
		if (final_boss == "lord_of_lightning") {
			botched_name = "Thunderman";
			confusion = scr_choose_from_array([
				"Huh, they told me your eyes were yellow, but... Wait, did I catch you without your contacts in?",
				"Thank the heavens for the clear skies, eh? Haha!\" You stare back, silent. \"Jeez, tough crowd huh? I guess they were wrong about your love of puns.",
			]);
		}
		
		return scr_choose_from_array([
			"\"Hey, wait up!\"\n\nThe man, dressed in classic adventuring gear, runs to catch up. Panting as he reaches you, he takes a beat to catch his breath, and says: \"Look, I need your help. I'm supposed to fight the, uh, " + botched_name + ", or something? You know, the one in the tower?\"\n\nExcited, you respond: \"I'm looking for the same person! Do you want to team up?\" \"... oh, uh, no, I just want you to give me your gear. Trust me, it's better that I do it.\" You eye him, incredulous. \"I... what? No, of course I will not just give you my stuff!\"\n\n\"All right, well, I tried it the nice way.\" He points his sword at you. \"I guess we'll have to do this the hard way.\"",
			"\"Hey! Hey you!\"\n\nYou turn around and see a man approaching you, grimy from a long journey. \"You're the one terrorising my village, aren't you? The one called " + botched_name + ", or something? " + confusion + "\"\n\nYou respond \"Uhm, that's not me, but I do think we're looking for the same person.\" He laughs. \"Hah, yeah right, I saw how you handled that " + enemy_name + ". You think I'd believe you were a mere quester? Have at you, fiend!\"\n\nYou sigh and ready yourself.",
		]);
	}
	
	if (enemy == "necromancer") {
		var intro = "You find yourself surrounded by headstones and makeshift crosses, the dirt beneath your feet recently overturned. A cold voice rings out:\n\n";
		
		intro += scr_choose_from_array([
			"\"Huh... I can't very well experiment with live specimen.\" As they lift their hands, the ground begins to stir...\n\n\"We'll have to do something about that, don't we?\"",
			"\"Aah, so you're responsible for all those fresh bodies.\" As they lift their hands, the ground begins to stir...\n\n\"I do thank you, but I think I still require more.\"",
			"\"The one you hunt... I need you to stop.\" As they lift their hands, the ground begins to stir...\n\n\"Who else do you think provides me with the materials for my work?\"",
		]);
		
		return intro;
		
	}
	
	if (enemy == "warlock") {
		var run_has_void_priest = run_has_enemy(floors, "void_priest");
		var ghoul_name = scr_choose_from_array([
			"Gregory",
			"Jaques",
			"Bertrand",
			"Fitzgerald",
			"Kathy",
			"Ritz",
			"Dickie",
		])
		
		if (run_has_void_priest) {
			return "Candlelight envelops you as you enter the town hall.\n\n\"By the void, the whispers were right! You have finally come.\" A tall, purple robed figure muses. \"So then you must be on your way to meet the the priest. Or rather, on your way to try and stop the priest. Oh, but I'm afraid you fail to see the grandeur of the work.\"\n\n\"A pity, really, that you will never see it come to fruition.\"";
		}
		
		return scr_choose_from_array([
			"You push open the door of the town hall.\n\n\"Oh how fun,\" a figure dressed in a purple robe lilts, lit by what must be a thousand candles lining inner walls, \"a witness to my summoning!\"\n\nBehind them a summoning circle is drawn in mauve chalk. A crimson mass lies in the middle.\n\n\"Or... ah, yes, I could use you in... other ways.\" The door shuts suddenly behind you.\n\n\"Come forth, now. You shall be part of something grand!\"",
			"A ghoulish figure, chains dragging behind them from every limb, lets you into the town hall with a moan. It shuts the door behind you.\n\n\"Thank you, " + ghoul_name + "!\" A purple figure sings, standing in front of an altar littered with candles.\n\n\"And you. Welcome! Welcome to tonight's big event. I do hope you don't mind volunteering to participate in the great summoning, rather than merely witnessing. Then again...\" The candles start to flicker wildly\n\n\"I don't think you have much of a choice in the matter.\"",
		]);
	}
	
	if (enemy == "mind_flayer") {
		var run_has_warrior = run_has_enemy(floors, "warrior");

		var reason_for_constitution = scr_choose_from_array([
			"Luckily, you rolled an 18 on your wisdom saving throw",
			"You concentrate on your arm and order it to stop"
		]);
		
		var intro = "As you enter the town hall, a whisper fills your head.\n\n";
		
		if (run_has_warrior) {
			intro += "\"Why, hello again, brave one. You handled my Spear Knight quite deftly!\"\n\n";
		} else {
			intro += "\"Hello, brave one... Ah, yes, yes, you will do quite nicely!\"\n\n";
		}
		
		intro += "You feel an odd tingle up your spine. \"The master may have some use for you!\" With a shock you realise your arm has started moving on its own. " + reason_for_constitution + " and manage to resist.\n\nYou look around to find the invader of your thoughts. Their white eyes gaze into you from their tentacled face. The whisper sounds once more: \"I will have you yet, brave one.\"";
		
		return intro;
	}
	
	if (enemy == "wyvern") {
		return scr_choose_from_array([
			"Your footsteps echo as you enter a cavernous chamber.\n\nYou hear a low growl above you. Atop a massive gargoyle is perched a winged beast.\n\nIt snarls fire and snap its jaw before dropping into flight, soaring in your direction.",
			"You enter something that looks more like a high cave than a chamber.\n\nGemstones and bits of gold surround an immense mass of fused metals, pieces of armour and jewellery sticking out of its molten shape. An equally immense wyvern lays on top, eyes trained on you.\n\nThe beast suddenly takes flight, soaring low over the floor as it heads straight for you.",
			"You find a balcony. It looks so inviting.\n\nA breeze soothes your tired body as you walk out. You can see for miles from here. Your peaceful moment is interrupted by the sharp flapping of wings. You turn to see a wyvern hovering, eyeing you, its mouth full of fire.\n\nWith a snarl, it soars your way.",
		]);
	}
	
	if (enemy == "witch") {
		var intro = "";
		var has_supermoon_perk = obj_game_manager.perks.supermoon;
		
		if (has_supermoon_perk) {
			intro += "\"This night... what a perfect night. Come, feel its radiance with me for a moment.\"\n\nYou join the woman in the shimmering gown in her chamber. Together you stand facing the tall window in silence, witnessing the massive, full moon, bathing in its light.\n\nShe speaks again, her voice full of sorrow, eyes still fixed on the celestial body.\n\n";
		} else {
			intro += "The windows are taller here. Moonlight filters in through them. \"Beautiful, isn't she?\" A voice speaks from behind you. A woman in a gown shimmering in the moonlight emerges.\n\n";
		}
		
		intro += "\"You should never have come here. You knew that. I'm sorry for what is about to happen, my old friend.\"";
		
		return intro;
	}
	
	if (enemy == "blacksmith") {
		var logo = "";
		
		if (run_has_enemy(floors, "crimson_mage")) {
			logo = "an intricate rose, constructed of rubies and emeralds. The thorns are embossed bronze spikes, smeared with a crimson liquid";
		}
		
		if (run_has_enemy(floors, "void_priest")) {
			logo = "rows and rows of teeth that... are they moving? The teeth surround a center so black no light seems to reflect off it";
		}
		
		if (run_has_enemy(floors, "lord_of_lightning")) {
			logo = "a giant, leering eye, with yellow gemstones surrounding a black onyx iris. The yellow of the eye seems to flicker";
		}
		
		return "A knight carrying a shield almost as tall as they are steps slowly into your path.\n\nThe shield displays " + logo + ".\n\nIt connects to the floor with a heavy thud as they set it down to block further passage.";
	}
	
	if (enemy == "lord_of_lightning") {
		var intro = "";
		var has_supermoon_perk = obj_game_manager.perks.supermoon;
		var has_lightning_bolt_card = scr_does_list_contain_item(deck_list, "lightning_bolt");
		
		if (has_supermoon_perk) {
			intro += "Clouds threaten to obscure the massive, looming moon as the sky starts to rumble.\n\n";
		} else {
			intro += "The sky darkens as yet stronger gusts of wind threaten to throw you off-balance.\n\n";
		}
		
		intro += "You climb the final steps of the staircase spiralling around the outside of the open tower. At the top, you find the Lord of Lightning, face pointed at the sky. He turns, his piercing yellow eyes find you.\n\n";
		
		if (has_lightning_bolt_card) {
			intro += "\"Well, well, a fellow practitioner! Isn't it an amazing feeling, to let slip raw electricity from your very fingers? Let us contest our might. That's what you came here for, is it not? To best me? This should be quite spectacular.\"\n\n";
		} else {
			intro += "\"Oh my, look who it is! I am shocked that you made it this far (get it?).\" You groan. \"Now, then! Let's give them a show, shall we?\"\n\n";
		}
		
		intro += "His hands start to crackle with energy.";
		
		return intro;
	}
	
	if (enemy == "void_priest") {
		var has_defeated_warlock = run_has_enemy(floors, "warlock");
		var has_call_of_the_void_card = scr_does_list_contain_item(deck_list, "call_of_the_void");
		var intro = "A sickly green glow casts around the room. Whispers of unknown origin fill your head as you enter. The Void Priest turns to you.\n\n";
		
		if (has_call_of_the_void_card) {
			intro += "\"I see you bear the mark of a void whisperer. Have you come to me as a disciple, friend?\" You raise your weapon. \"Ah... I guess not. But that's okay. The void's rupture is not a picky one, friend.\"\n\n\"Let us witness.\""
		} else if (has_defeated_warlock) {
			intro += "\"Why are you trying to stop something that is inevitable, friend? My disciple was never yours to end, they were meant for the void.\"\n\n\"But rejoice, friend, because so are you.\"";
		} else {
			intro += "\"Ah, welcome, friend. You have come to witness the awakening, I suppose? You are just in time.\"\n\n\"Let us begin.\""
		}
		
		return intro;
	}
	
	if (enemy == "crimson_mage") {
		var has_vampirism_perk = obj_game_manager.perks.vampires_curse;
		var intro = "The stained glass windows turn the moonlight a bright red. The Crimson Mage, enveloped in a billowing satin robe, observes you as you enter. She speaks:\n\n";
		
		if (has_vampirism_perk) {
			intro += "\"My, how curious... You are here as my enemy, yet it seems you share some of my... sensibilities, let's say?\"\n\n\"Perhaps I can help you sate that ceaseless thirst.\"";
		} else {
			intro += "\"Your journey... What a waste of time and blood. It ends now.\"";
		}
		
		return intro;
	}
}

function find_all_enemies(floors) {
	var enemies = ds_list_create();
	
	for (var f = 0; f <= ds_list_size(floors) - 1; f += 1) {
		var floor_to_check = ds_list_find_value(floors, f);
		
		for (var r = 0; r <= ds_list_size(floor_to_check[? "rooms"]) - 1; r += 1) {
			var room_to_check = ds_list_find_value(floor_to_check[? "rooms"], r);
			ds_list_add(enemies, room_to_check[? "enemy"]);
		}
	}
	
	return enemies;
}

function run_has_enemy(floors, enemy_id) {
	var enemies = find_all_enemies(floors);
	
	for (var e = 0; e <= ds_list_size(enemies) - 1; e += 1) {
		var enemy = ds_list_find_value(enemies, e);
		
		if (enemy[? "id"] == enemy_id) {
			return true;
			break;
		}
	}
	
	return false;
}