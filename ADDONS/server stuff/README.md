Installation instructions:

@yum_zedUndead - just install client side as you would any mod, and install yum.bikey to key's folder on server.  No need for mod server side. That's it!

@yum_skins - will throw errors, but work fine client side only (no serverside).  You'll need to add the items to your loot table (see my zombie_generate in mission stuff)
			mission overrides player_wearClothes with my fix. 
			in server login, you need to change a line to have more options (for all our skins). Use this:
		if (!(_model in ["SurvivorW2_DZ","Survivor2_DZ","Sniper1_DZ","Soldier1_DZ","Camo1_DZ","BanditW1_DZ","Bandit1_DZ","SurvivorW2_DZ","Bandit2_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ","Rocket_DZ","RU_Policeman_DZ","Pilot_EP1_DZ","Haris_Press_EP1_DZ","Ins_Soldier_GL_DZ","GUE_Commander_DZ","Functionary1_EP1_DZ","Priest_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","TK_INS_Warlord_EP1_DZ","TK_INS_Soldier_EP1_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","Drake_Light_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_TL_PMC_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ"])) then {
			_model = "Survivor2_DZ";
		};
		That's it!