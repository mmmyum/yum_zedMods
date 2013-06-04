private ["_position","_nearestLoc","_yum","_city","_tempZedNum","_radius","_cityTypes","_name"];
//_isAir = vehicle player iskindof "Air";
//_inVehicle = vehicle player isKindOf "player";
_position = getPosATL player;
_radius = 500;
_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];


if (((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) or (((dayz_maxCurrentZeds - sleepingZeds) > dayz_maxZeds))) exitwith {};

//_nearestLoc = nearestLocation [_position, _cityTypes]; //alternative to try /// definitely should try this, as there is no check range, but we have to execute it 4 times
_nearestLoc = (nearestLocations [_position, _cityTypes,_radius] select 0);

if (isNull _nearestLoc) then {
	//[_position] spawn yum_zedRoam;
} else {
	_name = text _nearestLoc;
	//pick nearest city from array and store it in _city
	_yum = yum_locations_index find _name;
	if (_yum == -1) exitwith {diag_log format ["MMMYUM: ZEDSYSTEM: No Location | PlayerPos: %1",_position];};
	_city = yum_locations select _yum;
	
	
	if ((time - player_lastZombieDespawn) > 33) then {
		if ((player_pendingSleepers > 0) or (player_pendingSpawned > 0)) then {
			_tempZedNum = _city getVariable ["numZombies", 0];
			_tempZedNum = (_tempZedNum + (player_pendingSleepers - player_pendingSpawned));
			
			_city setVariable ["numZombies", _tempZedNum, true];
			cutText [format["%1 Zeds left in Location", _tempZedNum], "PLAIN DOWN"];
			
			player_pendingSleepers = 0;
			player_pendingSpawned = 0;
		};	
		player_lastZombieDespawn = time;
	} else {
		//get var and check to see if the location should spawn zeds
		_tempZedNum = _city getVariable ["numZombies", 0];
		diag_log format ["MMMYUM: ZEDSYSTEM: player_spawnCheck | NearLocation = %1 | ToSpawn = %2 Zeds | PlayerPos = %3",_nearestLoc,_tempZedNum,_position];
		if (_tempZedNum > 0) then {
				[_city,_tempZedNum,_nearestLoc] spawn building_spawnZombies;//no need for this, call zombie_generate modified for city level spawning
		};
	};
};
/* notes
_nearestLoc = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
*/