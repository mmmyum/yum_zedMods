private["_obj","_type","_config","_canLoot","_unitTypes","_num","_zombieChance","_playerNear","_position","_clean","_positions","_iPos","_nearBy","_nearByPlayer"];

if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {}; 

_obj = 			_this select 0;
_type = 		typeOf _obj;
_config = 		configFile >> "CfgBuildingLoot" >> _type;
_canLoot = 		isClass (_config);

_position = getPosATL _obj;

_playerNear = ({(isPlayer _x) and (alive _x) and (_obj distance _x < 20)} count playableUnits) > 0;
if (_playerNear) exitwith {};

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
} else {
	_num = _obj getVariable ["numZombies", 0];
	if (num > 0) then {
		_unitTypes = [];
		
		while {_num > 0} do {
			if ((dayz_spawnZombies - sleepingZeds) > dayz_maxLocalZombies) exitwith {};
			[_position,true,_unitTypes] call zombie_generate;
			_num = _num - 1;
			sleep 0.2;
		};
		diag_log("Recycling zombies...");
		_obj setVariable ["numZombies", _num, true];
		//dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
	};
};