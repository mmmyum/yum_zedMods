private["_unit","_mBuilding","_tempZedNum"];
_unit = _this select 0;

//_mBuilding = nearestBuilding _unit;
//_numCleanup = _mBuilding getVariable ["despawnedZeds", 0];
//if (_numCleanup < 50) then {
//_numCleanup = _numCleanup + 1;
//_mBuilding setVariable ["despawnedZeds", _numCleanup, true];
//};
/* this will only work if the zombie was detected as created by the server, shouldn't for deleted client zombies
if (alive _agent) then {
	//_mBuilding = nearestBuilding _agent;
	_mBuilding = nearestObject [getPos _agent,"HouseBase"];
	_tempZedNum = _mBuilding getVariable ["numZombies", 0];
	if (!(isNil "_tempZedNum")) then {
		_mBuilding setVariable ["numZombies", _tempZedNum + 1, true];
	};
};
*/


diag_log ("CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );
diag_log format ["CLEANUP YUM RESPAWN COUNT %1 | %2",_tempZedNum,_mBuilding];

deleteVehicle _unit;