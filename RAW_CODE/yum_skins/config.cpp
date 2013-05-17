class CfgPatches 
{
	class yum_skins
	{
		units[]={};
		weapons[]={};
		requiredAddons[]= {dayz};
	};
};

class CfgMagazines
{
	class CA_Magazine;
	class SkinBase: CA_Magazine
	{
		scope = 0;
		count = 1;
		type = 256;
		displayName = "Clothes";
		model = "\dayz_equip\models\cloth_parcel.p3d";
		picture = "\dayz_equip\textures\equip_cloth_parcel_ca.paa";
		descriptionShort = "Clothes Parcel";
		class ItemActions
		{
			class Use
			{
				text = "Wear %1";
				script = "spawn player_wearClothes;";
			};
			class Crafting
			{
				text = "Craft Canvas";
				script = "spawn player_craftItem;";
				neednearby[] = {};
				requiretools[] = {"ItemToolbox","ItemKnife"};
				output[] = {{"ItemCanvas",1}};
				input[] = {{"SkinBase",4}};
			};
		};
	};
	class Skin_Sniper1_DZ: SkinBase
	{
		scope = 2;
		displayName = "$STR_EQUIP_NAME_43";
		descriptionShort = "$STR_EQUIP_DESC_43";
	};
	class Skin_Rocket_DZ: SkinBase
	{
		scope = 2;
		displayName = "Officer Suit";
		descriptionShort = "Officer Suit";
	};
	class Skin_RU_Policeman_DZ: SkinBase
	{
		scope = 2;
		displayName = "Police Officer Uniform";
		descriptionShort = "Police Officer Uniform";
	};
	class Skin_Pilot_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Pilot Uniform";
		descriptionShort = "Pilot Uniform";
	};
	class Skin_Haris_Press_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Press Uniform";
		descriptionShort = "Press Uniform";
	};
	class Skin_Ins_Soldier_GL_DZ: SkinBase
	{
		scope = 2;
		displayName = "Terrorist Uniform";
		descriptionShort = "Terrorist Uniform";
	};
	class Skin_GUE_Commander_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rebel Uniform";
		descriptionShort = "Rebel Uniform";
	};
	class Skin_Functionary1_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Business Suit";
		descriptionShort = "Business Suit";
	};
	class Skin_Priest_DZ: SkinBase
	{
		scope = 2;
		displayName = "Priest Outfit";
		descriptionShort = "Priest Outfit";
	};
	class Skin_Rocker1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (black)";
	};	
	class Skin_Rocker2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (brown)";
	};
	class Skin_Rocker3_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (blue)";
	};
	class Skin_Rocker4_DZ: SkinBase
	{
		scope = 2;
		displayName = "Rocker Outfit";
		descriptionShort = "Rocker (green)";
	};
	class Skin_Bandit1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Outfit";
		descriptionShort = "Bandit Outfit";
	};	
	class Skin_Bandit2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Camo";
		descriptionShort = "Bandit Camo Outfit";
	};
	class Skin_GUE_Soldier_MG_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Gunner";
		descriptionShort = "Bandit Gunner Outfit";
	};
	class Skin_GUE_Soldier_Sniper_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Sniper";
		descriptionShort = "Bandit Sniper Outfit";
	};
	class Skin_GUE_Soldier_Crew_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Baklava";
		descriptionShort = "Bandit Baklava Outfit";
	};
	class Skin_GUE_Soldier_CO_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Mask";
		descriptionShort = "Bandit Mask Outfit";
	};
	class Skin_GUE_Soldier_2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Hat";
		descriptionShort = "Bandit Hat with Baklava";
	};
	class Skin_BanditW1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit (female)";
		descriptionShort = "Bandit (female)";
	};
	class Skin_BanditW2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bandit Camo (female)";
		descriptionShort = "Bandit Camo (female)";
	};
	class Skin_SurvivorW3_DZ: SkinBase
	{
		scope = 2;
		displayName = "Camo Pants (female)";
		descriptionShort = "Camo Pants (female)";
	};
	class Skin_SurvivorW2_DZ: SkinBase
	{
		scope = 2;
		displayName = "Civilian (female)";
		descriptionShort = "Civilian (female)";
	};
	class Skin_SurvivorWpink_DZ: SkinBase
	{
		scope = 2;
		displayName = "Pink (female)";
		descriptionShort = "Pink Clothes (female)";
	};

	class Skin_SurvivorWcombat_DZ: SkinBase
	{
		scope = 2;
		displayName = "Camo (female)";
		descriptionShort = "Camo Clothes (female)";
	};
	class Skin_SurvivorWdesert_DZ: SkinBase
	{
		scope = 2;
		displayName = "Desert (female)";
		descriptionShort = "Desert Clothes (female)";
	};
	class Skin_SurvivorWurban_DZ: SkinBase
	{
		scope = 2;
		displayName = "Urban (female)";
		descriptionShort = "Urban Clothes (female)";
	};


	class Skin_TK_INS_Warlord_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Takistani Warlord";
		descriptionShort = "Takistani Warlord";
	};
	class Skin_TK_INS_Soldier_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Takistani Soldier";
		descriptionShort = "Takistani Soldier";
	};
	class Skin_CZ_Special_Forces_GL_DES_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Special Forces";
		descriptionShort = "Special Forces";
	};
	class Skin_Drake_Light_DZ: SkinBase
	{
		scope = 2;
		displayName = "Desert Camo";
		descriptionShort = "Desert Camo";
	};
	class Skin_Soldier_Bodyguard_AA12_PMC_DZ: SkinBase
	{
		scope = 2;
		displayName = "Bodyguard";
		descriptionShort = "Bodyguard";
	};
	class Skin_FR_OHara_DZ: SkinBase
	{
		scope = 2;
		displayName = "Jungle Camo";
		descriptionShort = "Jungle Camo";
	};
	class Skin_FR_Rodriguez_DZ: SkinBase
	{
		scope = 2;
		displayName = "Gunner Outfit";
		descriptionShort = "Gunner Outfit";
	};
	class Skin_CZ_Soldier_Sniper_EP1_DZ: SkinBase
	{
		scope = 2;
		displayName = "Desert Guille";
		descriptionShort = "Desert Guille";
	};
	class Skin_Graves_Light_DZ: SkinBase
	{
		scope = 2;
		displayName = "Urban Camo";
		descriptionShort = "Urban Camo";
	};
	class Skin_Soldier_Sniper_PMC_DZ: SkinBase
	{
		scope = 2;
		displayName = "Marksman";
		descriptionShort = "Marksman";
	};
	class Skin_Soldier_TL_PMC_DZ: SkinBase
	{
		scope = 2;
		displayName = "Team Leader";
		descriptionShort = "Team Leader";
	};



	class Skin_Camo1_DZ: SkinBase
	{
		scope = 2;
		displayName = "$STR_EQUIP_NAME_44";
		descriptionShort = "$STR_EQUIP_DESC_44";
	};
	class Skin_Survivor2_DZ: SkinBase
	{
		scope = 2;
		displayName = "$STR_EQUIP_NAME_45";
		descriptionShort = "$STR_EQUIP_DESC_45";
	};
	class Skin_Soldier1_DZ: SkinBase
	{
		scope = 2;
		displayName = "$STR_EQUIP_NAME_46";
		descriptionShort = "$STR_EQUIP_DESC_46";
	};
};

#include "CfgVehicles.hpp"
/*

class CfgLoot
{
	clothes[] = {
		{
			"Skin_RU_Policeman_DZ",
			"Skin_Pilot_EP1_DZ",
			"Skin_Functionary1_EP1_DZ",
			"Skin_Priest_DZ",
			"Skin_Rocker2_DZ",
			"Skin_SurvivorW3_DZ",
			"Skin_SurvivorWpink_DZ",
			"Skin_SurvivorWurban_DZ",
		},
		{
			0.01,
			0.02,
			0.03,
			0.02,
			0.02,
			0.05,
			0.02,
			0.01,
		}
	};
	militaryclothes[] = {
		{
			"Skin_Camo1_DZ",
			"Skin_Sniper1_DZ",
			"Skin_Rocket_DZ",
			"Skin_Soldier1_DZ",
			"Skin_Drake_Light_DZ",
			"Skin_Soldier_TL_PMC_DZ",
			"Skin_Soldier_Sniper_PMC_DZ",
			"Skin_Soldier_Bodyguard_AA12_PMC_DZ",
			"Skin_CZ_Special_Forces_GL_DES_EP1_DZ",
			"Skin_FR_OHara_DZ",
			"Skin_FR_Rodriguez_DZ",
			"Skin_CZ_Soldier_Sniper_EP1_DZ",
			"Skin_Graves_Light_DZ"
		},
		{
			0.03, // "Skin_Camo1_DZ",
			0.02, // "Skin_Sniper1_DZ",
			0.03, // "Skin_Rocket_DZ",
			0.05, // "Skin_Soldier1_DZ",
			0.01, // "Skin_Drake_Light_DZ"
			0.02, // Skin_Soldier_TL_PMC_DZ
			0.02, // Skin_Soldier_Sniper_PMC_DZ
			0.02, // Skin_Soldier_Bodyguard_AA12_PMC_DZ
			0.02, // Skin_CZ_Special_Forces_GL_DES_EP1_DZ
			0.01, // "Skin_FR_OHara_DZ",
			0.01, // "Skin_FR_Rodriguez_DZ",
			0.01, // "Skin_CZ_Soldier_Sniper_EP1_DZ",
			0.01, // "Skin_Graves_Light_DZ"
		}
	};
	specialclothes[] = {
		{
			"Skin_Ins_Soldier_GL_DZ",
			"Skin_GUE_Commander_DZ",
			"Skin_Bandit1_DZ",
			"Skin_Bandit2_DZ",
			"Skin_BanditW1_DZ",
			"Skin_BanditW2_DZ",
			"Skin_TK_INS_Soldier_EP1_DZ",
			"Skin_TK_INS_Warlord_EP1",
			"Skin_SurvivorWcombat_DZ",
			"Skin_SurvivorWdesert_DZ",
			"Skin_GUE_Soldier_MG_DZ",
			"Skin_GUE_Soldier_Sniper_DZ",
			"Skin_GUE_Soldier_Crew_DZ",
			"Skin_GUE_Soldier_CO_DZ",
			"Skin_GUE_Soldier_2_DZ",
		},
		{
			0.01, //"Skin_Ins_Soldier_GL_DZ",
			0.01, //"Skin_GUE_Commander_DZ",
			0.05, //"Skin_Bandit1_DZ",
			0.02, //"Skin_Bandit2_DZ",
			0.05, //"Skin_BanditW1_DZ",
			0.03, //"Skin_BanditW2_DZ",
			0.01, //"Skin_TK_INS_Soldier_EP1_DZ",
			0.01, //"Skin_TK_INS_Warlord_EP1",
			0.01, //"Skin_SurvivorWcombat_DZ",
			0.03, //"Skin_SurvivorWdesert_DZ",
			0.01, //"Skin_GUE_Soldier_MG_DZ",
			0.01, //"Skin_GUE_Soldier_Sniper_DZ",
			0.01, //"Skin_GUE_Soldier_Crew_DZ",
			0.01, //"Skin_GUE_Soldier_CO_DZ",
			0.01, //"Skin_GUE_Soldier_2_DZ",
		}
	};
}; */
