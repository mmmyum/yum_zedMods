private["_unit","_mBuilding","_numCleanup"];
_unit = _this select 0;

_mBuilding = nearestBuilding _unit;
_numCleanup = _mBuilding getVariable ["despawnedZeds", 0];
if (_numCleanup < 50) then {
_numCleanup = _numCleanup + 1;
_mBuilding setVariable ["despawnedZeds", _numCleanup, true];
};

diag_log ("CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );
diag_log format ["CLEANUP YUM RESPAWN COUNT %1 | %2",_numCleanup,_mBuilding];

deleteVehicle _unit;