private["_isAir","_inVehicle","_position","_nearby","_tooManyZs","_bPos","_bWithin","_zombiesNum","_shouldNotZeds","_spawnTime","_yumDefT","_numCleanup"];
//_isAir = vehicle player iskindof "Air";
_inVehicle = vehicle player isKindOf "player";
_position = getPosATL player;
//_nearby = nearestObjects [_position, ["Office","Church","Land_HouseV_1I4","Land_kulna","Land_Ind_Workshop01_01","Land_Ind_Garage01","Land_Ind_Workshop01_02","Land_Ind_Workshop01_04","Land_Ind_Workshop01_L","Land_Hangar_2","Land_hut06","Land_stodola_old_open","Land_A_FuelStation_Build","Land_A_GeneralStore_01a","Land_A_GeneralStore_01","Land_Farm_Cowshed_a","Land_stodola_open","Land_Barn_W_01","Land_Hlidac_budka","Land_HouseV2_02_Interier","Land_a_stationhouse","Land_Mil_ControlTower","Land_SS_hangar","Land_A_Pub_01","Land_HouseB_Tenement","Land_A_Hospital","Land_Panelak","Land_Panelak2","Land_Shed_Ind02","Land_Shed_wooden","Land_Misc_PowerStation","Land_HouseBlock_A1_1","Land_Shed_W01","Land_HouseV_1I1","Land_Tovarna2","Land_rail_station_big","Land_Ind_Vysypka","Land_A_MunicipalOffice","Land_A_Office01","Land_A_Office02","Land_A_BuildingWIP","Land_Church_01","Land_Church_03","Land_Church_02","Land_Church_02a","Land_Church_05R","Land_Mil_Barracks_i","Land_A_TVTower_Base","Land_Mil_House","Land_Misc_Cargo1Ao","Land_Misc_Cargo1Bo","Land_Nav_Boathouse","Land_ruin_01","Land_wagon_box","Land_HouseV2_04_interier","Land_HouseV2_01A","Land_psi_bouda","Land_KBud","Land_A_Castle_Bergfrit","Land_A_Castle_Stairs_A","Land_A_Castle_Gate","Land_Mil_Barracks","Land_Mil_Barracks_L","Land_Barn_W_02","Land_sara_domek_zluty","Land_HouseV_3I4","Land_Shed_W4","Land_HouseV_3I1","Land_HouseV_1L2","Land_HouseV_1T","Land_telek1","Land_Rail_House_01","Land_HouseV_2I","Land_Misc_deerstand","Camp","CampEast","CampEast_EP1","MASH","MASH_EP1","UH1Wreck_DZ","USMC_WarfareBFieldhHospital","Land_Ind_Shed_02_main","Land_Shed_W03","Land_HouseV_1I3","Land_HouseV_1L1","Land_HouseV_1I2","Land_HouseV_2L","Land_HouseV_2T1","Land_houseV_2T2","Land_HouseV_3I2","Land_HouseV_3I3","Land_HouseBlock_A1","Land_HouseBlock_A1_2","Land_HouseBlock_A2","Land_HouseBlock_A2_1","Land_HouseBlock_A3","Land_HouseBlock_B1","Land_HouseBlock_B2","Land_HouseBlock_B3","Land_HouseBlock_B4","Land_HouseBlock_B5","Land_HouseBlock_B6","Land_HouseBlock_C1","Land_HouseBlock_C2","Land_HouseBlock_C3","Land_HouseBlock_C4","Land_HouseBlock_C5","Land_HouseV2_01B","Land_Misc_Cargo1D","Land_HouseV2_03","Land_Ind_Shed_01_end","Land_A_statue01","Land_Shed_W02"], 200];
_radius = 200;


if (((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) or (((dayz_maxCurrentZeds - sleepingZeds) > dayz_maxZeds))) exitwith {};

if (_inVehicle) then {
	_radius = 100;
} else {
	if ((dayz_spawnZombies - sleepingZeds) > (dayz_maxLocalZombies / 2)) then {
		_radius = 150;
	} else {
		if (dayz_spawnZombies - sleepingZeds == 0) then {
			_radius = 250;
		} else {
			_radius = 200;
		};
	};
};

_nearby = nearestObjects [_position,["HouseBase","Strategic","Church"],_radius]; //should cover all objects that can spawn/respawn zeds
{
	_shouldNotZeds = _x getVariable ["spawnedZeds", false];
	//if (_shouldNotZeds) then {
	//	_yumDefT = time;
	//	_spawnTime = _x getVariable ["zedSpawnT", _yumDefT];
	//	if ((time - _spawnTime) > 1800) then {
	//		_bPos = getPosATL _x; //if building has already spawned zeds and 30 mins have passed, spawn zeds
	//		_bWithin = count _nearby;
	//		_zombiesNum = {alive _x} count (_bPos nearEntities ["zZombie_Base",250]);
	//		if ((_zombiesNum < 300) and (_zombiesNum < (7 * _bWithin))) then {
	//			[_x] call building_spawnZombies;
	//		};
	//	};
	//};		

	//building spawns
	if (((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) or (((dayz_maxCurrentZeds - sleepingZeds) > dayz_maxZeds))) exitwith {};
	//_tempZedNum = _x getVariable ["numZombies", 0];
	//if (_tempZedNum > 0) then {
			[_x] spawn building_spawnZombies;
	//};
	sleep 0.1;
} forEach _nearby;
