private ["_unit","_tempZedNum","_tempDist","_lastLoc","_nearestLoc","_tempDistNew","_position","_cityTypes","_name","_yum","_city"];
_unit = _this select 0;


if (alive _unit) then {
	_nearestLoc = "";
	////locality issue cause we don't transmit the variable originLoc so the server doesn't get anything

		//_city = _unit getVariable "originLoc";
		
	_position = getPosATL _unit;
	//_radius = 500;
	_cityTypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];
	{
		_nearestLoc = nearestLocation [_position, _x]; //alternative to try
		_tempDistNew = (position _nearestLoc) distance _unit;
		if (!(isNil "_tempDist")) then {
			if (_tempDist > _tempDistNew) then {
				_tempDist = _tempDistNew;
				_lastLoc = _nearestLoc;
			};
		} else {
		_tempDist = _tempDistNew;
		_lastLoc = _nearestLoc;
		};
	} forEach _cityTypes;
		
	_name = text _nearestLoc;
	
	if (count server_zedDespawnPool > 0) then {
		_counter = 0;
		{
			if ((_x select 0) == _name) exitWith {
				_tempZeds = _x select 1;
				server_zedDespawnPool set [_counter, [_name, _tempZeds + 1]];
			};
			_counter = _counter + 1;
		} forEach server_zedDespawnPool;
	} else {
		server_zedDespawnPool set [0, [_name,1]];
	};
	
	/*
	//pick nearest city from array and store it in _city
	_yum = yum_locations_index find _name;
	if (_yum == -1) exitwith {diag_log format ["MMMYUM: ZEDSYSTEM: DESPAWN: No Location | AgentPos: %1",_position];};
	_city = yum_locations select _yum;
	_tempZedNum = _city getVariable ["numZombies", 0];
		
	if (!(isNil "_tempZedNum")) then {
		_city setVariable ["numZombies", _tempZedNum + 1, true];

	};
	*/
	//diag_log format ["MMMYUM: ZEDSYSTEM: DESPAWN: COUNT %1 | %2 | AgentPos: %3",_tempZedNum,_city,_position];

};



diag_log ("MMMYUM: ZEDSYSTEM: CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );

deleteVehicle _unit;

/*


6:13:59 "MMMYUM: ZEDSYSTEM: CLEANUP: DELETE UNCONTROLLED ZOMBIE: z_worker3 OF: Agent 0x2f878080"
16:13:59 "Second Hand Zombie Initialized: [[6309.24,2477.01,0.00162983],Agent 0x2fc6e080,true]"
16:13:59 "MMMYUM: ZEDSYSTEM: DESPAWN: COUNT any | any"
16:13:59 Error in expression <
};
} forEach _cityTypes;

_name = text _nearestLoc;

_yum = yum_locations_index>
16:13:59 Error position: <_nearestLoc;

_yum = yum_locations_index>
16:13:59 Error Undefined variable in expression: _nearestloc
16:13:59 File mpmissions\__cur_mp.chernarus\fixes\zombie_findOwner.sqf, line 26			*/