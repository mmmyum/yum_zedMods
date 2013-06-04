private ["_obj","_type","_config","_originalPos","_unitTypes","_yumTime","_numCleanup"];
_obj =            _this select 0;
_numCleanup = _this select 1;
_type =        typeOf _obj;
_config =        configFile >> "CfgBuildingLoot" >> _type;
_originalPos =    getPosATL _obj;

//Get zombie class
_unitTypes =    getArray (_config >> "zombieClass");

//Walking Zombies
for "_i" from 1 to _numCleanup do
{
    [_originalPos,_unitTypes] call zombie_generate;
	sleep 0.2;
};
dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
_obj setVariable ["despawnedZeds", 0, true];
_yumTime = time;
_obj setVariable ["zedSpawnT", _yumTime, true];
