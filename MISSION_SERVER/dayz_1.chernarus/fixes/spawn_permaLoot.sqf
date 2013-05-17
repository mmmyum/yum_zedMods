////////////////////////////////////////////////////////////////////////////////mmmyum
private ["_center","_allBldngs","_type","_config","_canLoot","_handle","_debugA","_countBldngs","_debugB","_debugC"];
	diag_log("MMMYUM: LOOT: BEGIN PermaLootSpawn...");
	_debugC = 1;
	_center = [6143.6,7721.5,1];//stary coords, centerish
	_debugA = count _center;
	_debugB = _center select 0;
	diag_log format ["MMMYUM: LOOT: CENTER:| %1 | COUNT:| %2 | POS 0:| %3",_center,_debugA,_debugB];
	_allBldngs = _center nearObjects ["building",20000];
	_countBldngs = count _allBldngs;
	diag_log format ["MMMYUM: LOOT: BLDNGS:| COUNT:| %1 | ",_countBldngs];
	{
		_type = typeOf _x;
		_config = configFile >> "CfgBuildingLoot" >> _type;
		_canLoot = isClass (_config);
		//diag_log format ["MMMYUM: LOOT: CANLOOT:| %1 |",_canLoot];
		//diag_log format ["MMMYUM: LOOT: TYPE:| %1 |",_type];
		if (_canLoot) then {           
			//_handle = [_x] spawn building_spawnLoot;//his
			_handle = [_x] execVM "fixes\building_spawnLoot.sqf";
			waitUntil{scriptDone _handle};
			_x setVariable ["permaLoot",true];
		};
		_debugC = _debugC + 1;
	} forEach _allBldngs;
	diag_log format ["MMMYUM: LOOT: END: PermaLootSpawn times cycled:| %1 |",_debugC];
	exit
////////////////////////////////////////////////////////////////////////////////mmmyum