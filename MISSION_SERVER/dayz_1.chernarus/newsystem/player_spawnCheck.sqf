private["_isAir","_inVehicle","_position","_nearby","_tooManyZs","_bPos","_bWithin","_zombiesNum","_shouldNotZeds","_spawnTime","_yumDefT","_numCleanup"];
//_isAir = vehicle player iskindof "Air";
//_inVehicle = vehicle player isKindOf "player";
_position = getPosATL player;
_radius = 200;
_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];


if (((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) or (((dayz_maxCurrentZeds - sleepingZeds) > dayz_maxZeds))) exitwith {};

if (isNull _nearestLoc) then {
	//[_position] spawn yum_zedRoam;
} else {
	//_nearestCity = nearestLocation [_position, _cityTypes]; //alternative to try

	_nearestLoc = (nearestLocations [_position, _cityTypes,_radius] select 0);
	//pick nearest city from array and store it in _city
	_yum = find _nearestLoc yum_locations;
	_city = yum_locations select _yum;
	//get var and check to see if the location should spawn zeds
	_tempZedNum = _city getVariable ["numZombies", 0];
	if (_tempZedNum > 0) then {
			[_city,_tempZedNum] spawn building_spawnZombies;//no need for this, call zombie_generate modified for city level spawning
	};
};
/* notes
_nearestLoc = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
*/