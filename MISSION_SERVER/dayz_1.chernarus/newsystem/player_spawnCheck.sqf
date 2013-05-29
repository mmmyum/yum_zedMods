private ["_position","_nearestLoc","_yum","_city","_tempZedNum","_radius","_cityTypes"];
//_isAir = vehicle player iskindof "Air";
//_inVehicle = vehicle player isKindOf "player";
_position = getPosATL player;
_radius = 500;
_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];


if (((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) or (((dayz_maxCurrentZeds - sleepingZeds) > dayz_maxZeds))) exitwith {};

//_nearestLoc = nearestLocation [_position, _cityTypes]; //alternative to try
_nearestLoc = (nearestLocations [_position, _cityTypes,_radius] select 0);

if (isNull _nearestLoc) then {
	//[_position] spawn yum_zedRoam;
} else {

	//pick nearest city from array and store it in _city
	_yum = yum_locations find _nearestLoc;
	_city = yum_locations select _yum;
	//get var and check to see if the location should spawn zeds
	_tempZedNum = _city getVariable ["numZombies", 0];
	diag_log format ["MMMYUM: ZEDSYSTEM: player_spawnCheck | NearLocation = %1 | ToSpawn = %2 Zeds | PlayerPos = %3",_nearestLoc,_tempZedNum,_position];
	if (_tempZedNum > 0) then {
			[_city,_tempZedNum,_nearestLoc] spawn building_spawnZombies;//no need for this, call zombie_generate modified for city level spawning
	};
};
/* notes
_nearestLoc = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
*/