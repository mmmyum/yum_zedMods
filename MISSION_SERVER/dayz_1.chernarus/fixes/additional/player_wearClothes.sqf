/*
_item spawn player_wearClothes;
TODO: female
*/
private["_item","_isFemale","_itemNew","_item","_onLadder","_model","_hasclothesitem","_config","_text"];
_item = _this;
call gear_ui_init;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hasclothesitem = _this in magazines player;
_config = configFile >> "CfgMagazines";
_text = getText (_config >> _item >> "displayName");

if (!_hasclothesitem) exitWith {cutText [format[(localize "str_player_31"),_text,"wear"] , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not change clothes while in a vehicle", "PLAIN DOWN"]};

_isFemale = ((typeOf player == "SurvivorW2_DZ")||(typeOf player == "BanditW1_DZ"));
if (_isFemale) exitWith {cutText ["Currently Female Characters cannot change to this skin. This will change in a future update.", "PLAIN DOWN"]};

private["_itemNew","_myModel","_humanity","_isBandit","_isHero"];
_myModel = (typeOf player);
_humanity = player getVariable ["humanity",0];
_isBandit = _humanity < -2000;
_isHero = _humanity > 5000;
_itemNew = "Skin_" + _myModel;

if ( !(isClass(_config >> _itemNew)) ) then {
	_itemNew = if (!_isFemale) then {"Skin_Survivor2_DZ"} else {"Skin_SurvivorW2_DZ"}; 
};

_model = [_item, "Skin_", ""] call CBA_fnc_replace;


switch (_item) do {
	case "Skin_Sniper1_DZ": {
		_model = "Sniper1_DZ";
	};
	case "Skin_Camo1_DZ": {
		_model = "Camo1_DZ";
	};
	case "Skin_Soldier1_DZ": {
		_model = "Soldier1_DZ";
	};
	case "Skin_Survivor2_DZ": {
		_model = "Survivor2_DZ";
		if (_isBandit) then {
			_model = "Bandit1_DZ";
		};
		if (_isHero) then {
			_model = "Survivor3_DZ";
		};
	};
	//YUM CLOTHES START
	case "Skin_Bandit2_DZ": {
		_model = "Bandit2_DZ";
	};
	case "Skin_GUE_Soldier_MG_DZ": {
		_model = "GUE_Soldier_MG_DZ";
	};
	case "Skin_GUE_Soldier_Sniper_DZ": {
		_model = "GUE_Soldier_Sniper_DZ";
	};
	case "Skin_GUE_Soldier_Crew_DZ": {
		_model = "GUE_Soldier_Crew_DZ";
	};
	case "Skin_GUE_Soldier_CO_DZ": {
		_model = "GUE_Soldier_CO_DZ";
	};
	case "Skin_GUE_Soldier_2_DZ": {
		_model = "GUE_Soldier_2_DZ";
	};
	case "Skin_Rocket_DZ": {
		_model = "Rocket_DZ";
	};
	case "Skin_RU_Policeman_DZ": {
		_model = "RU_Policeman_DZ";
	};
	case "Skin_Pilot_EP1_DZ": {
		_model = "Pilot_EP1_DZ";
	};
	case "Skin_Haris_Press_EP1_DZ": {
		_model = "Haris_Press_EP1_DZ";
	};
	case "Skin_Ins_Soldier_GL_DZ": {
		_model = "Ins_Soldier_GL_DZ";
	};
	case "Skin_GUE_Commander_DZ": {
		_model = "GUE_Commander_DZ";
	};
	case "Skin_Functionary1_EP1_DZ": {
		_model = "Functionary1_EP1_DZ";
	};
	case "Skin_Priest_DZ": {
		_model = "Priest_DZ";
	};
	case "Skin_Rocker1_DZ": {
		_model = "Rocker1_DZ";
	};
	case "Skin_Rocker2_DZ": {
		_model = "Rocker2_DZ";
	};
	case "Skin_Rocker3_DZ": {
		_model = "Rocker3_DZ";
	};
	case "Skin_Rocker4_DZ": {
		_model = "Rocker4_DZ";
	};
	case "Skin_TK_INS_Warlord_EP1_DZ": {
		_model = "TK_INS_Warlord_EP1_DZ";
	};
	case "Skin_TK_INS_Soldier_EP1_DZ": {
		_model = "TK_INS_Soldier_EP1_DZ";
	};
	case "Skin_CZ_Special_Forces_GL_DES_EP1_DZ": {
		_model = "CZ_Special_Forces_GL_DES_EP1_DZ";
	};
	case "Skin_Drake_Light_DZ": {
		_model = "Drake_Light_DZ";
	};
	case "Skin_Soldier_Bodyguard_AA12_PMC_DZ": {
		_model = "Soldier_Bodyguard_AA12_PMC_DZ";
	};
	case "Skin_Soldier_Sniper_PMC_DZ": {
		_model = "Soldier_Sniper_PMC_DZ";
	};
	case "Skin_Soldier_TL_PMC_DZ": {
		_model = "Soldier_TL_PMC_DZ";
	};
	case "Skin_FR_OHara_DZ": {
		_model = "FR_OHara_DZ";
	};
	case "Skin_FR_Rodriguez_DZ": {
		_model = "FR_Rodriguez_DZ";
	};
	case "Skin_CZ_Soldier_Sniper_EP1_DZ": {
		_model = "CZ_Soldier_Sniper_EP1_DZ";
	};
	case "Skin_Graves_Light_DZ": {
		_model = "Graves_Light_DZ";
	};
};	//YUM CLOTHES END

	
if (_model != _myModel) then {
	player removeMagazine _item;
	player addMagazine _itemNew;
	[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
};