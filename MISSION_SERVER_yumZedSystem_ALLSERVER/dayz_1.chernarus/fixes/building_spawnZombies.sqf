private ["_obj","_unitTypes","_num","_position","_nLoc"];

if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {}; 

_obj = 			_this select 0;
_num = 			_this select 1;
_nLoc = 		_this select 2;
//_type = 		_obj getVariable ["type", ""];
//_name = 		_obj getVariable ["name", locationNull];
_position = locationPosition (_nLoc);
//need to get radius value here
diag_log format ["MMMYUM: ZEDSYSTEM: building_spawnZombies start at %1",_position];

//_playerNear = ({(isPlayer _x) and (alive _x) and (_obj distance _x < 20)} count playableUnits) > 0;
//if (_playerNear) exitwith {};

//_num = _obj getVariable ["numZombies", 0];
if (_num > 0) then {
	_unitTypes = [];
	if (_num > 20) then {
		_num = 20;
	};
	while {_num > 0} do {
		if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {};
		[_position,_obj] call zombie_generate; //add radius value to pass
		_num = _num - 1;
		sleep 0.2;
	};
	diag_log("LOCATION ZOMBIE SPAWN...");
	//_obj setVariable ["numZombies", _num, true];

};
//};
		//dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
/*
//_canLoot = 		isClass (_config);
if (_canLoot) then {
	_num = _obj getVariable ["numZombies", 0];
	
	if (_num > 0) then {
		
		_unitTypes = 	getArray (_config >> "zombieClass");
		//_unitTypes = _obj getVariable ["zedTypes", 0];
		_positions =	getArray (_config >> "lootPos");
		diag_log(format[("Trying to spawn %1 zombies..."), _num]);
	//Get zombie class
		{
			if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {};
			if (_num < 1) exitWith {};
			_iPos = _obj modelToWorld _x;
			_nearBy = {alive _x} count nearestObjects [_iPos, ["zZombie_Base"],1] > 0;
			if (!_nearBy) then {
				_num = _num - 1;
				[_iPos,true,_unitTypes] call zombie_generate;
			};
			sleep 0.2;
		} forEach _positions;
		
		
		while {_num > 0} do {
			if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {};
			[_position,true,_unitTypes] call zombie_generate;
			_num = _num - 1;
			sleep 0.2;
		};
		
		_obj setVariable ["numZombies", _num, true];
	};

	//dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
} else {*/