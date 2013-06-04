////////////////////////////////////////////////////////////////////////////////mmmyum
private ["_center","_allBldngs","_type","_config","_canLoot","_handle","_debugA","_countBldngs","_debugB","_debugC"];
	diag_log("MMMYUM: INIT: BEGIN PermaLootSpawn...");
	_debugC = 1;
	_center = [6143.6,7721.5,1];//stary coords, centerish
	_debugA = count _center;
	_debugB = _center select 0;
	diag_log format ["MMMYUM: INIT: CENTER:| %1 | COUNT:| %2 | POS 0:| %3",_center,_debugA,_debugB];
	_allBldngs = _center nearObjects ["building",20000];
	_countBldngs = count _allBldngs;
	diag_log format ["MMMYUM: INIT: BLDNGS:| COUNT:| %1 | ",_countBldngs];
	{
		_type = typeOf _x;
		_config = configFile >> "CfgBuildingLoot" >> _type;
		_canLoot = isClass (_config);
		if (_canLoot) then {
			_handle = [_x] execVM "fixes\building_spawnLoot.sqf";
			waitUntil{scriptDone _handle};
			_x setVariable ["permaLoot",true];
		};
		_debugC = _debugC + 1;
	} forEach _allBldngs;
	
	//use this line for all locations? "" call bis_fnc_locations
	yum_locations = [["NameCityCapital","NameCity","NameVillage","NameLocal"],[_center,25000]] call BIS_fnc_locations; 
	publicVariable "yum_locations";
	{
		//put code here to check location type, then assign it a number appropriate to it, and set the radius for that type
		 _x setVariable ["numZombies", 200, true];
		sleep 0.01;
	} foreach yum_locations;
	
	yum_locations_index = [];
	_iCnt = 0;
	{
	_tempName = _x getVariable ["name","nil"];
	yum_locations_index set [_iCnt,_tempName];
	_iCnt = _iCnt + 1;
	} forEach yum_locations;
	publicVariable "yum_locations_index";
	
	diag_log format ["MMMYUM: INIT: END: PermaSpawn INIT loot times cycled:| %1 | locations count %2",_debugC,(count yum_locations)];
	exit
////////////////////////////////////////////////////////////////////////////////mmmyum
