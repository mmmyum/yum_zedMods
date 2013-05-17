private ["_obj","_type","_config","_originalPos","_unitTypes","_num","_yumTime"];
_obj =            _this select 0;
_type =        typeOf _obj;
_config =        configFile >> "CfgBuildingLoot" >> _type;
_originalPos =    getPosATL _obj;


//Get zombie class
_unitTypes =    getArray (_config >> "zombieClass");



//Walking Zombies
_num = 3;
for "_i" from 1 to _num do
{
    [_originalPos,_unitTypes] call zombie_generate;
	sleep 0.02;
};
dayz_buildingMonitor set [count dayz_buildingMonitor,_obj];
_obj setVariable ["spawnedZeds", true, true];
_yumTime = time;
_obj setVariable ["zedSpawnT", _yumTime, true];
